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
}
