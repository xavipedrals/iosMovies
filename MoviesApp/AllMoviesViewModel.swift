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
    var currentGenre: MovieGenre! {
        didSet {
            getMovies(offset: 0, genre: currentGenre)
        }
    }
    var isDataRefreshing: Bool!
    
    init() {
        isDataRefreshing = false
        currentGenre = .all
    }
    
    func getMoreMovies() {
        getMovies(offset: self.movies.value.count, genre: currentGenre)
    }
    
    func getMovies(offset: Int, genre: MovieGenre) {
        if !isDataRefreshing {
            isDataRefreshing = true
            NetworkController.getMovies(offset: offset, genre: genre) {
                movies in
                if offset == 0 {
                    self.movies.value = movies
                }
                else {
                    self.movies.value.append(contentsOf: movies)
                }
                self.isDataRefreshing = false
            }
        }
    }
}
