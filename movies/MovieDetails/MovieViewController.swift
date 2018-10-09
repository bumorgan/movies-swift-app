//
//  MovieViewController.swift
//  movies
//
//  Created by Bruno Morgan on 03/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import UIKit
import Kingfisher
import Moya

class MovieViewController: UIViewController, MovieView {

    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieImageView: UIImageView!
    var movieId: Int!
    var movie: MovieDetailsRM?
    var moviePresenter: MoviePresenter!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviePresenter = MoviePresenter(movieView: self)
        moviePresenter.getMovieDetails(id: movieId)
    }
    
    func displayMovieView(movie: MovieDetailsRM) {
        self.movie = movie
        self.overviewLabel.text = self.movie?.overview
        self.movieTitleLabel.text = "\(self.movie?.title ?? "No title") (\(self.movie?.releaseDate.components(separatedBy: "-")[0] ?? "????"))"
        self.movieImageView.kf.setImage(with: URL(string: self.movie?.backdropUrl ?? ""))
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
        let alert = UIAlertController(title: "Failed to get the movie information", message: "No internet connection", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: { action in self.moviePresenter.getMovieDetails(id: self.movieId) }))
        self.present(alert, animated: true)
    }
}
