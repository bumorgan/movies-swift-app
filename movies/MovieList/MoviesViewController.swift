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
        adapter = MoviesTableViewAdapter(tableView: moviesTableView)
        moviesPresenter = MoviesPresenter(moviesView: self)
        moviesPresenter.getMovieSummaryList()
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
        let alert = UIAlertController(title: "Failed to get the movies list", message: "No internet connection", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: { action in self.moviesPresenter.getMovieSummaryList() }))        
        self.present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.moviesTableView.indexPathForSelectedRow {
            let controller = segue.destination as! MovieViewController
            controller.movieId = movies?[indexPath.row].id
        }
    }
}
