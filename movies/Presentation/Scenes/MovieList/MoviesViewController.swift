//
//  MoviesViewController.swift
//  movies
//
//  Created by Bruno Morgan on 04/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa

class MoviesViewController: UIViewController, MoviesView {
    
    @IBOutlet var moviesTableView: UITableView!
    var movies: [Movie]?
    var adapter: MoviesTableViewAdapter!
    var moviesPresenter: MoviesPresenter!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var tryAgainButton: UIButton!
    @IBOutlet var emptyState: UIView!
    
    private let onViewLoadedSubject: PublishSubject<()> = PublishSubject()
    private let onMovieSelectedSubject: PublishSubject<Movie> = PublishSubject()

    override func viewDidLoad() {
        super.viewDidLoad()
        adapter = MoviesTableViewAdapter(tableView: moviesTableView)
        moviesPresenter = MoviesPresenter(moviesView: self)
        onViewLoadedSubject.onNext(())
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        moviesPresenter.dispose()
    }
    
    func displayMoviesView(movies: [Movie]) {
        self.movies = movies
        self.adapter.setData(movies: movies)
    }
    
    func displayLoading() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    func hideLoading() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func displayEmptyState() {
        emptyState.isHidden = false
    }
    
    func displayMovieDetail(id: Int) {
        self.performSegue(withIdentifier: "movie_detail", sender: id)
    }
    
    func hideEmptyState() {
        emptyState.isHidden = true
    }
    
    var onTryAgain: Observable<()> {
        return tryAgainButton.rx.tap.asObservable()
    }
    
    var onViewLoaded: Observable<()> {
        return onViewLoadedSubject
    }
    
    var onMovieSelected: Observable<Movie> {
        return adapter.movieSelectedObservable
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let movieId = sender as? Int {
            let controller = segue.destination as! MovieViewController
            controller.movieId = movieId
        }
    }
}
