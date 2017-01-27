//
//  MovieDetailViewController.swift
//  MoviesApp
//
//  Created by Xavi on 27/01/2017.
//  Copyright © 2017 jedi. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var bigLikeImageView: UIImageView!
    
    var movie: Movie?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieImageView.kf.setImage(with: URL(string: movie!.image!), placeholder: UIImage(named: "popcorn"))
        movieTitleLabel.text = movie!.title!.uppercased()
        priceLabel.text = movie!.price!
        categoryLabel.text = categoryLabel.text! + " " + movie!.category!
        directorLabel.text = directorLabel.text! + " " + movie!.director!
        durationLabel.text = durationLabel.text! + " " + movie!.duration!
        summaryLabel.text = movie!.summary!
        configDoubleTapGestureRecognizer()
    }
    
    func configDoubleTapGestureRecognizer() {
        movieImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        movieImageView.addGestureRecognizer(tap)
    }
    
    func doubleTapped() {
        BigLikeAnimation.start(likeView: self.bigLikeImageView)
    }

    @IBAction func backPressed(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }

}
