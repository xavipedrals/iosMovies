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


extension UIScrollView {
    func  isNearBottomEdge(edgeOffset: CGFloat = 50.0) -> Bool {
        return self.contentOffset.y + self.frame.size.height + edgeOffset > self.contentSize.height
    }
}

class AllMoviesViewController: UIViewController {

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    let moviesViewModel = AllMoviesViewModel()
    var cellWidth: Double?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesViewModel.movies.asObservable()
            .bindTo(moviesCollectionView.rx.items(cellIdentifier: "movieCell", cellType: MovieCollectionViewCell.self)) {
                _, movie, cell in
                cell.initCell(from: movie)
            }
            .addDisposableTo(disposeBag)
        
        
        self.moviesCollectionView.rx.contentOffset
            .flatMap { _ in
                return self.moviesCollectionView.isNearBottomEdge(edgeOffset: 20.0)
                    ? Observable.just(())
                    : Observable.empty()
            }
            .subscribe(onNext: { _ in
                self.moviesViewModel.getMoreMovies()
            })
            .addDisposableTo(disposeBag)
        
        
        moviesCollectionView.rx.setDelegate(self)
            .addDisposableTo(disposeBag)
        
    }
    
    override func viewDidLayoutSubviews() {
        setCellWidth()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToMovieDetail" {
//            let index = moviesCollectionView.indexPathsForSelectedItems?[0]
//            let movieDetailVC = segue.destination as! MovieDetailViewController
//            movieDetailVC.movie = movies[index!.row]
//        }
//    }
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "moviesHeader", for: indexPath) as! HeaderCollectionReusableView
            header.delegate = self
            header.initSegment()
            return header
        }
        else {
            return UICollectionReusableView()
        }
        
    }
}

//extension AllMoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "goToMovieDetail", sender: nil)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        
//        if kind == UICollectionElementKindSectionHeader {
//            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "moviesHeader", for: indexPath) as! HeaderCollectionReusableView
//            header.delegate = self
//            header.initSegment()
//            return header
//        }
//        else {
//            return UICollectionReusableView()
//        }
//        
//    }

//}

extension AllMoviesViewController: MoviesUpdater {
    
    func switchToMoviesWith(genre: MovieGenre) {
//        currentGenre = genre
//        movies = [Movie]()
//        getMovies(offset: 0, genre: genre)
    }
}



