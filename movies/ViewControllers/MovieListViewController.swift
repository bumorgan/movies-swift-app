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

class MovieViewController: UIViewController {

    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieImageView: UIImageView!
    var selectedMovie: MovieRM?
    var movie: MovieDetailsRM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let provider = MoyaProvider<MovieApi>()
        provider.request(.movie(id: (selectedMovie?.id)!)) { (result) in
            switch result {
            case .success(let response):
                self.movie = try? response.map(MovieDetailsRM.self)
                self.overviewLabel.text = self.movie?.overview
                self.movieTitleLabel.text = "\(self.selectedMovie?.title ?? "No title") (\(self.selectedMovie?.releaseDate.components(separatedBy: "-")[0] ?? "????"))"
                self.movieImageView.kf.setImage(with: URL(string: self.movie?.backdropUrl ?? ""))
            case .failure(let error):
                print(error)
            }
        }
    }
}
