//
//  MovieRepository.swift
//  movies
//
//  Created by Bruno Morgan on 17/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//
import RxSwift

class MovieRepository {
    
    var movieRDS: MovieRDS = MovieRDS()
    var movieCDS: MovieCDS = MovieCDS()
    
    // retorna um single que pega da net e guarda no banco e se der erro na net pega do banco
    func getMovieSummaryList() -> Single<[Movie]> {
        return movieRDS.getMovieSummaryList().map({ moviesRM in moviesRM.map({ $0.toCM() }) }).flatMap({ (movies: [MovieCM]) -> Single<[MovieCM]> in
            return self.movieCDS.upsertMovieSummaryList(list: movies).andThen(Single.just(movies))
        }).catchError({ error in
            return self.movieCDS.getMovieSummaryList().flatMap({ cacheMovies in
                if (cacheMovies != nil) {
                    return Single.just(cacheMovies!)
                } else {
                    return Single.error(error)
                }
            })
        }).map({ moviesCM in moviesCM.map({ $0.toDM() }) })
    }
    
    //Verifica se existe na cache antes de tentar puxar da internet
    func getMovieSummaryList2() -> Single<[Movie]> {
        return movieCDS.getMovieSummaryList().flatMap({ cacheMovies in
            if (cacheMovies != nil) {
                return Single.just(cacheMovies!)
            } else {
                return self.movieRDS.getMovieSummaryList().map({ moviesRM in moviesRM.map({ $0.toCM() }) }).flatMap({ (movies: [MovieCM]) -> Single<[MovieCM]> in
                    return self.movieCDS.upsertMovieSummaryList(list: movies).andThen(Single.just(movies))
                })
            }
        }).map({ (moviesCM: [MovieCM]) in moviesCM.map({ $0.toDM() }) })
    }
    
    func getMovie(movieId: Int) -> Single<MovieDetails> {
        return movieRDS.getMovie(movieId: movieId).map({ $0.toCM() }).flatMap({ movie in
            return self.movieCDS.upsertMovieDetails(movieDetails: movie).andThen(Single.just(movie))
        }).catchError({ error in
            return self.movieCDS.getMovieDetails(movieId: movieId).flatMap({ cacheMovie in
                if (cacheMovie != nil) {
                    return Single.just(cacheMovie!)
                } else {
                    return Single.error(error)
                }
            })
        }).map({ $0.toDM() })
    }
    
    //Verifica se existe na cache antes de tentar puxar da internet
    func getMovie2(movieId: Int) -> Single<MovieDetails> {
        return movieCDS.getMovieDetails(movieId: movieId).flatMap({ cacheMovie in
            if (cacheMovie != nil) {
                return Single.just(cacheMovie!)
            } else {
                return self.movieRDS.getMovie(movieId: movieId).map({ $0.toCM() }).flatMap({ movie in
                    return self.movieCDS.upsertMovieDetails(movieDetails: movie).andThen(Single.just(movie))
                })
            }
        }).map({ (movie: MovieDetailsCM) in movie.toDM() })
    }
    
}
