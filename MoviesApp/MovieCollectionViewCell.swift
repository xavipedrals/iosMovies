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
    
    func initCell(from: Movie) {
        movieImageView.kf.setImage(with: URL(string: from.image!), placeholder: UIImage(named: "popcorn"))
    }
    
}
