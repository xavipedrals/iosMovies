//
//  MovieCollectionViewCell.swift
//  MoviesApp
//
//  Created by jedi17 on 26/1/17.
//  Copyright © 2017 jedi. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    
    func initCell(from: Movie) {
        movieTitle.text = from.title!
        movieImageView.kf.setImage(with: URL(string: from.image!))
    }
    
}
