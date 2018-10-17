//
//  MovieRDS.swift
//  movies
//
//  Created by Bruno Morgan on 17/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import Moya
import RxMoya
import RxSwift

import Foundation

class MovieRDS {
    func getMovieSummaryList() -> Single<[MovieRM]> {
        let provider = MoyaProvider<MovieApi>()
        return provider.rx.request(.movies).map([MovieRM].self)
    }
    func getMovie(movieId: Int) -> Single<MovieDetailsRM> {
        let provider = MoyaProvider<MovieApi>()
        return provider.rx.request(.movie(id: movieId)).map(MovieDetailsRM.self)
    }
}
