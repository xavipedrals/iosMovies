//
//  NetworkController.swift
//  MoviesApp
//
//  Created by jedi17 on 26/1/17.
//  Copyright © 2017 jedi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkController {
    
    private static var getMoviesUrl = "https://itunes.apple.com/us/rss/topmovies/limit=30/json"
    
    
    static func getOffsetUrl(offset: Int) -> String {
        let limit = offset + 30
        let url = getMoviesUrl.replacingOccurrences(of: "30", with: String(limit))
        return url
    }
    
    static func getMovies(offset: Int, completion: @escaping (_ movies: [Movie]) -> Void) {
        
        let moviesUrl = getOffsetUrl(offset: offset)
        
        Alamofire.request(moviesUrl).responseJSON {
            response in
            
            switch response.result {
            case .success(let data):
                
                let json = JSON(data)
                let entries = json["feed"]["entry"].arrayValue
                
                var movies = [Movie]()
                
                for i in offset..<entries.count {
                    let movie = entries[i]
                    let newMovie = Movie(json: movie)
                    movies.append(newMovie)
                }
                
                completion(movies)
                
            case .failure(let error):
                print(error)
                return
                
            }
        }
    }
    
}
