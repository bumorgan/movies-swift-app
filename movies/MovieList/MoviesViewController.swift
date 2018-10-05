//
//  MoviesViewController.swift
//  movies
//
//  Created by Bruno Morgan on 04/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import UIKit
import Moya
import Kingfisher

class MoviesViewController: UIViewController, MoviesView {
    
    @IBOutlet var moviesTableView: UITableView!
    var movies: [MovieRM]?
    var adapter: MoviesTableViewAdapter!
    var moviesPresenter: MoviesPresenter!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        adapter = MoviesTableViewAdapter(tableView: moviesTableView)
        moviesPresenter = MoviesPresenter(moviesView: self)
        moviesPresenter.getMovieSummaryList()
    }
    
    func displayMoviesView(movies: [MovieRM]) {
        self.movies = movies
        self.adapter.setData(movies: movies)
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.moviesTableView.indexPathForSelectedRow {
            let controller = segue.destination as! MovieViewController
            controller.movieId = movies?[indexPath.row].id
        }
    }
}
