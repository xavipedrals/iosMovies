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
    
    private static var getAllMoviesUrl = "https://itunes.apple.com/us/rss/topmovies/limit=50/json"
    
    static func getAllMovies(completion: @escaping (_ movies: [Movie]) -> Void) {
        Alamofire.request(getAllMoviesUrl).responseJSON {
            response in
            
            switch response.result {
            case .success(let data):
                
                let json = JSON(data)
                let entries = json["feed"]["entry"].arrayValue
                
                var movies = [Movie]()
                
                for movie in entries {
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
