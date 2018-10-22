//
//  Movie.swift
//  movies
//
//  Created by Bruno Morgan on 02/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import Foundation

struct MovieRM: Codable {
    let id: Int
    let voteAverage: Float
    let title: String
    let posterUrl: String
    let genres: [String]
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case voteAverage = "vote_average"
        case title
        case posterUrl = "poster_url"
        case genres
        case releaseDate = "release_date"
    }
}
