//
//  MoviesViewController.swift
//  movies
//
//  Created by Bruno Morgan on 04/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import UIKit
import Kingfisher

class MoviesViewController: UIViewController, MoviesView {
    
    @IBOutlet var moviesTableView: UITableView!
    var movies: [MovieRM]?
    var adapter: MoviesTableViewAdapter!
    var moviesPresenter: MoviesPresenter!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var emptyState: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter = MoviesTableViewAdapter(tableView: moviesTableView)
        adapter.movieSelectedObservable.subscribe(onNext: { movie in
            self.performSegue(withIdentifier: "movie_detail", sender: movie.id)
        })
        moviesPresenter = MoviesPresenter(moviesView: self)
        moviesPresenter.getMovieSummaryList()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        moviesPresenter.dispose()
    }
    
    func displayMoviesView(movies: [MovieRM]) {
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
    
    @IBAction func tryAgainButton(_ sender: Any) {
        emptyState.isHidden = true
        moviesPresenter.getMovieSummaryList()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let movieId = sender as? Int {
            let controller = segue.destination as! MovieViewController
            controller.movieId = movieId
        }
    }
}
