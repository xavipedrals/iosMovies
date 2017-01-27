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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMovieDetail" {
            let index = moviesCollectionView.indexPathsForSelectedItems?[0]
            let movieDetailVC = segue.destination as! MovieDetailViewController
            movieDetailVC.movie = movies[index!.row]
        }
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: cellWidth!, height: (cellWidth! * 6 / 4))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToMovieDetail", sender: nil)
    }
    
    func setCellWidth () {
        let flow: UICollectionViewFlowLayout = moviesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let width = (moviesCollectionView.frame.size.width - (flow.sectionInset.right + flow.sectionInset.left) * 2) / 3
        cellWidth = Double(width) - 1
    }
}



