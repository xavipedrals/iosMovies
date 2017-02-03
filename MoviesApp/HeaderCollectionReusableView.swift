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
}

class HeaderCollectionReusableView: UICollectionReusableView {
    
    var delegate: MoviesUpdater?
    @IBOutlet weak var genreSegmentedControl: CustomSegment!
    
    
    func initSegment() {
        let font = UIFont(name: "Montserrat-Light", size: 12.0)
        genreSegmentedControl.setTitleTextAttributes([NSFontAttributeName: font!], for: .normal)
        
    }
    
    @IBAction func changedSection(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            delegate?.switchToMoviesWith(genre: .all)
        case 1:
            delegate?.switchToMoviesWith(genre: .scifi)
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
