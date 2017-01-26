//
//  ViewController.swift
//  MoviesApp
//
//  Created by jedi17 on 26/1/17.
//  Copyright © 2017 jedi. All rights reserved.
//

import UIKit

class AllMoviesViewController: UIViewController {

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    var movies: [Movie]!
    var cellWidth: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movies = [Movie]()
        NetworkController.getAllMovies() {
            movies in
            self.movies = movies
            self.moviesCollectionView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        setCellWidth()
    }

}



extension AllMoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        
        cell.initCell(from: movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: cellWidth!, height: cellWidth! + 50)
    }
    
    func setCellWidth () {
        let flow: UICollectionViewFlowLayout = moviesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let width = (moviesCollectionView.frame.size.width - (flow.sectionInset.right + flow.sectionInset.left) * 2) / 2
        cellWidth = Double(width) - 10
    }
    

}

