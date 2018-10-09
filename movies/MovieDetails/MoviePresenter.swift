//
//  MoviePresenter.swift
//  movies
//
//  Created by Bruno Morgan on 05/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import Foundation
import Moya

class MoviePresenter {
    let movieView: MovieView
    
    init (movieView: MovieView) {
        self.movieView = movieView
    }
    
    func getMovieDetails(id: Int) -> Void {
        let provider = MoyaProvider<MovieApi>()
        self.movieView.displayLoading()
        provider.request(.movie(id: id)) { (result) in
            switch result {
            case .success(let response):
                if let movie = try? response.map(MovieDetailsRM.self) {
                    self.movieView.hideLoading()
                    self.movieView.displayMovieView(movie: movie)
                }
            case .failure:
                self.movieView.hideLoading()
                self.movieView.displayEmptyState()
            }
        }
    }
}
