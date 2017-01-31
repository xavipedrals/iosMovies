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
    var isDataRefreshing: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movies = [Movie]()
        isDataRefreshing = false
        getMovies(offset: 0)
    }
    
    func getMovies(offset: Int) {
        isDataRefreshing = true
        NetworkController.getMovies(offset: offset) {
            movies in
            
//            self.moviesCollectionView.reloadData()
            var indexPaths = [IndexPath]()
            for i in self.movies.count ..< (movies.count + self.movies.count) {
                indexPaths.append(IndexPath(row: i, section: 0))
            }
            self.movies.append(contentsOf: movies)
            self.moviesCollectionView.insertItems(at: indexPaths)
            
            self.isDataRefreshing = false
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "moviesHeader", for: indexPath)
            return header
        }
        else {
            return UICollectionReusableView()
        }
        
    }
    
    func setCellWidth () {
        let flow: UICollectionViewFlowLayout = moviesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let width = (moviesCollectionView.frame.size.width - (flow.sectionInset.right + flow.sectionInset.left) * 2) / 3
        cellWidth = Double(width) - 1
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        let bounds = scrollView.bounds
        let size = scrollView.contentSize
        let inset = scrollView.contentInset
        let y = offset.y + bounds.size.height - inset.bottom
        let h = size.height
        let reloadDistance = 30
        
        if y > h + CGFloat(reloadDistance) && !isDataRefreshing {
            getMovies(offset: movies.count)
        }
    }
}



