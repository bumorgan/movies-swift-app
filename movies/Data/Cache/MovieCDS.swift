//
//  MovieCDS.swift
//  movies
//
//  Created by Bruno Morgan on 18/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import Foundation
import SwiftyUserDefaults
import RxSwift

struct MovieCDS {
    
    func upsertMovieSummaryList(list: [MovieCM]) -> Completable {
        return Completable.empty().do(onCompleted: {
            Defaults[.movieSummaryListKey] = list
        })
    }
    
    func getMovieSummaryList() -> Single<[MovieCM]?> {
        return Observable.create({ (emitter: AnyObserver<[MovieCM]?>) -> Disposable in
            emitter.onNext(Defaults[.movieSummaryListKey])
            return Disposables.create()
        }).take(1).asSingle()
    }
    
    func upsertMovieDetails(movieDetails: MovieDetailsCM) -> Completable {
        return Completable.empty().do(onCompleted: {
            Defaults[getMovieKey(movieId: movieDetails.id)] = movieDetails
        })
    }
    
    func getMovieDetails(movieId: Int) -> Single<MovieDetailsCM?> {
        return Observable.create({ (emitter: AnyObserver<MovieDetailsCM?>) -> Disposable in
            emitter.onNext(Defaults[getMovieKey(movieId: movieId)])
            return Disposables.create()
        }).take(1).asSingle()
    }
}

private func getMovieKey(movieId: Int) -> DefaultsKey<MovieDetailsCM?> {
    return DefaultsKey<MovieDetailsCM?>("movieDetail-\(movieId)")
}

extension DefaultsKeys {
    static let movieSummaryListKey = DefaultsKey<[MovieCM]?>("movieSummaryList")
}
