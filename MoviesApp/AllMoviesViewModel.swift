//
//  AllMoviesViewModel.swift
//  MoviesApp
//
//  Created by Xavier Pedrals on 23/02/2017.
//  Copyright © 2017 jedi. All rights reserved.
//

import Foundation
import RxSwift

class AllMoviesViewModel {
    
    let movies = Variable<[Movie]>([])
    var currentGenre: MovieGenre!
    var isDataRefreshing: Bool!
    
    init() {
        isDataRefreshing = false
        currentGenre = .all
        getMovies(offset: 0, genre: currentGenre)
    }
    
    func getMoreMovies() {
        getMovies(offset: self.movies.value.count, genre: currentGenre)
    }
    
    func getMovies(offset: Int, genre: MovieGenre) {
        if !isDataRefreshing {
            isDataRefreshing = true
            NetworkController.getMovies(offset: offset, genre: genre) {
                movies in
                self.movies.value.append(contentsOf: movies)
                self.isDataRefreshing = false
            }
        }
    }
}
