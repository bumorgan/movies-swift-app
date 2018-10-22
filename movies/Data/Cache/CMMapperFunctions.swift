//
//  CMMapperFunctions.swift
//  movies
//
//  Created by Bruno Morgan on 19/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import Foundation

extension MovieCM {
    func toDM() -> Movie {
        return Movie(id: id, voteAverage: voteAverage, title: title, posterUrl: posterUrl, genres: genres, releaseDate: releaseDate)
    }
}

extension MovieDetailsCM {
    func toDM() -> MovieDetails {
        return MovieDetails(adult: adult, backdropUrl: backdropUrl, id: id, overview: overview, posterUrl: posterUrl, releaseDate: releaseDate, title: title)
    }
}
