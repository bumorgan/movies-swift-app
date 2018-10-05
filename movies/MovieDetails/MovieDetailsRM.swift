//
//  MovieDetailsRM.swift
//  movies
//
//  Created by Bruno Morgan on 04/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import Foundation

struct MovieDetailsRM: Decodable {
    let adult: Bool
    let backdropUrl: String
    let id: Int
    let overview: String
    let posterUrl: String
    let releaseDate: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropUrl = "backdrop_url"
        case id
        case overview
        case posterUrl = "poster_url"
        case releaseDate = "release_date"
        case title
    }
}
