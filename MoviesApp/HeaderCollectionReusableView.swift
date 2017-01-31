//
//  HeaderCollectionReusableView.swift
//  MoviesApp
//
//  Created by jedi17 on 31/1/17.
//  Copyright © 2017 jedi. All rights reserved.
//

import UIKit

protocol MoviesUpdater {
    func switchToMoviesWith(genre: MovieGenre)
    func switchToAllMovies()
}

class HeaderCollectionReusableView: UICollectionReusableView {
    
    var delegate: MoviesUpdater?
    
    @IBAction func changedSection(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            delegate?.switchToAllMovies()
        case 1:
            delegate?.switchToMoviesWith(genre: .thriller)
            break
        case 2:
            delegate?.switchToMoviesWith(genre: .action)
            break
        case 3:
            delegate?.switchToMoviesWith(genre: .anime)
            break
        default:
            return
        }
    }

    
}
