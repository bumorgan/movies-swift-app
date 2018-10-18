//
//  MovieRepository.swift
//  movies
//
//  Created by Bruno Morgan on 17/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import Foundation
import RxSwift

class MovieRepository {
    
    var movieRDS: MovieRDS = MovieRDS()
    
    func getMovieSummaryList() -> Single<[MovieRM]> {
        return movieRDS.getMovieSummaryList()
    }
    func getMovie(movieId: Int) -> Single<MovieDetailsRM> {
        return movieRDS.getMovie(movieId: movieId)
    }
}
