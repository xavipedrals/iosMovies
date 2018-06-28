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

enum MovieGenre: String {
    case all
    case scifi = "4413"
    case action = "4401"
    case anime = "4402"
}

class NetworkController {
    
    private static var getMoviesUrl = "https://itunes.apple.com/us/rss/topmovies/limit=30/json"
    private static var getMoviesWithGenreUrl = "https://itunes.apple.com/us/rss/topmovies/limit=30/genre=4401/json"
    
    static func addOffsetTo(url: inout String, offset: Int) {
        let limit = offset + 30
        url = url.replacingOccurrences(of: "30", with: String(limit))
    }
    
    static func getUrlWith(genre: MovieGenre) -> String {
        switch genre {
        case .scifi:
            let finalUrl = getMoviesWithGenreUrl.replacingOccurrences(of: "4401", with: MovieGenre.scifi.rawValue)
            return finalUrl
        case .anime:
            let finalUrl = getMoviesWithGenreUrl.replacingOccurrences(of: "4401", with: MovieGenre.anime.rawValue)
            return finalUrl
        case .action:
            return getMoviesWithGenreUrl
        case .all:
            return getMoviesUrl
        }
    }
    
    static func getMovies(offset: Int, genre: MovieGenre, completion: @escaping (_ movies: [Movie]) -> Void) {
        
        var moviesGenreUrl = getUrlWith(genre: genre)
        addOffsetTo(url: &moviesGenreUrl, offset: offset)
        
        Alamofire.request(moviesGenreUrl).responseJSON {
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
