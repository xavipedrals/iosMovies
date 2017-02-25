//
//  ViewController.swift
//  MoviesApp
//
//  Created by jedi17 on 26/1/17.
//  Copyright © 2017 jedi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AllMoviesViewController: UIViewController {

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var genreSegmentedControl: CustomSegment!
    
    let moviesViewModel = AllMoviesViewModel()
    var cellWidth: Double?
    var selectedMovie: Movie?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesViewModel.movies.asObservable()
            .bindTo(moviesCollectionView.rx.items(cellIdentifier: "movieCell", cellType: MovieCollectionViewCell.self)) {
                _, movie, cell in
                cell.initCell(from: movie)
            }
            .addDisposableTo(disposeBag)
        
        
        moviesCollectionView.rx.contentOffset
            .flatMap { _ in
                return self.moviesCollectionView.isNearBottomEdge(edgeOffset: 20.0)
                    ? Observable.just(())
                    : Observable.empty()
            }
            .subscribe(onNext: { _ in
                self.moviesViewModel.getMoreMovies()
            })
            .addDisposableTo(disposeBag)
        
        moviesCollectionView.rx.modelSelected(Movie.self)
            .subscribe(onNext: {
                movie in
                self.selectedMovie = movie
                self.performSegue(withIdentifier: "goToMovieDetail", sender: nil)
            })
            .addDisposableTo(disposeBag)
        
        
        
        moviesCollectionView.rx.setDelegate(self)
            .addDisposableTo(disposeBag)
        
    }
    
    @IBAction func changedSection(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            moviesViewModel.currentGenre = .all
        case 1:
            moviesViewModel.currentGenre = .scifi
        case 2:
            moviesViewModel.currentGenre = .action
        case 3:
            moviesViewModel.currentGenre = .anime
        default:
            return
        }
    }
    
    override func viewDidLayoutSubviews() {
        setCellWidth()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMovieDetail" {
            let movieDetailVC = segue.destination as! MovieDetailViewController
            movieDetailVC.movie = selectedMovie!
        }
    }
}

extension AllMoviesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth!, height: (cellWidth! * 6 / 4))
    }
    
    func setCellWidth () {
        let flow: UICollectionViewFlowLayout = moviesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let width = (moviesCollectionView.frame.size.width - (flow.sectionInset.right + flow.sectionInset.left) * 2) / 3
        cellWidth = Double(width) - 1
    }
}



