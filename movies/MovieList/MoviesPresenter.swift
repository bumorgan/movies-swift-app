//
//  MoviesPresenter.swift
//  movies
//
//  Created by Bruno Morgan on 05/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import Foundation
import Moya

class MoviesPresenter {
    let moviesView: MoviesView
    
    init(moviesView: MoviesView) {
        self.moviesView = moviesView
    }
    
    func getMovieSummaryList() -> Void {
        let provider = MoyaProvider<MovieApi>()
        provider.request(.movies) { (result) in
            switch result {
            case .success(let response):
                if let movies = try? response.map([MovieRM].self) {
                    self.moviesView.displayMoviesView(movies: movies)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
