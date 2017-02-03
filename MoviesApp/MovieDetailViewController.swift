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
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var bigLikeImageView: UIImageView!
    
    var movie: Movie?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieImageView.kf.setImage(with: URL(string: movie!.image!), placeholder: UIImage(named: "popcorn"))
        movieTitleLabel.text = movie!.title!.uppercased()
        priceLabel.text = movie!.price!
        
        let categoryStr = getLightPlusRegularString(light: categoryLabel.text! + "  ", regular: movie!.category!)
        let directorStr = getLightPlusRegularString(light: directorLabel.text! + "  ", regular: movie!.director!)
        let releasedStr = getLightPlusRegularString(light: releasedLabel.text! + "  ", regular: movie!.releaseDate!)
        categoryLabel.attributedText = categoryStr
        directorLabel.attributedText = directorStr
        releasedLabel.attributedText = releasedStr
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
    
    func getLightPlusRegularString(light: String, regular: String) -> NSAttributedString {
        let lightAttribute = [ NSFontAttributeName: UIFont(name: "Montserrat-Light", size: 15.0)! ]
        let lightString = NSMutableAttributedString(string: light, attributes: lightAttribute )
        
        let regularAttribute = [ NSFontAttributeName: UIFont(name: "Montserrat-Regular", size: 15.0)! ]
        let regularString = NSMutableAttributedString(string: regular, attributes: regularAttribute )
        
        lightString.append(regularString)
        
        return lightString
    }

    @IBAction func backPressed(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }

}
