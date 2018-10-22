//
//  RMMapperFunctions.swift
//  movies
//
//  Created by Bruno Morgan on 19/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import Foundation

extension MovieRM {
    func toCM() -> MovieCM {
        return MovieCM(id: id, voteAverage: voteAverage, title: title, posterUrl: posterUrl, genres: genres, releaseDate: releaseDate)
    }
}

extension MovieDetailsRM {
    func toCM() -> MovieDetailsCM {
        return MovieDetailsCM(adult: adult, backdropUrl: backdropUrl, id: id, overview: overview, posterUrl: posterUrl, releaseDate: releaseDate, title: title)
    }
}
