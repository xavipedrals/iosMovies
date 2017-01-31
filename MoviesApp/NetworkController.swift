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

enum MovieGenre {
    case thriller
    case action
    case anime
}

class NetworkController {
    
    private static var getMoviesUrl = "https://itunes.apple.com/us/rss/topmovies/limit=30/json"
    private static var getMoviesWithGenreUrl = "https://itunes.apple.com/us/rss/topmovies/limit=30/genre=4401/json"
    private static var actionGenre = "4401"
    private static var animeGenre = "4402"
    private static var thrillerGenre = "4416"
    
    
    static func getUrlWith(offset: Int, url: String) -> String {
        let limit = offset + 30
        let offsetUrl = url.replacingOccurrences(of: "30", with: String(limit))
        return offsetUrl
    }
    
    static func getMovies(offset: Int, completion: @escaping (_ movies: [Movie]) -> Void) {
        
        let moviesUrl = getUrlWith(offset: offset, url: getMoviesUrl)
        
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
    
    static func getUrlWith(genre: MovieGenre, url: String) -> String {
        switch genre {
        case .thriller:
            let finalUrl = url.replacingOccurrences(of: "4401", with: thrillerGenre)
            return finalUrl
        case .anime:
            let finalUrl = url.replacingOccurrences(of: "4401", with: animeGenre)
            return finalUrl
        default:
            return url
        }
    }
    
    static func getMovies(offset: Int, genre: MovieGenre, completion: @escaping (_ movies: [Movie]) -> Void) {
        
        let moviesGenreUrl = getUrlWith(genre: genre, url: getMoviesWithGenreUrl)
        let finalUrl = getUrlWith(offset: offset, url: moviesGenreUrl)
        
        Alamofire.request(finalUrl).responseJSON {
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
