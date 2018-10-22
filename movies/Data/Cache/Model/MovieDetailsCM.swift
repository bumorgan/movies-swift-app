//
//  MovieDetailsCM.swift
//  movies
//
//  Created by Bruno Morgan on 19/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import SwiftyUserDefaults

struct MovieDetailsCM: Codable, DefaultsSerializable {
    let adult: Bool
    let backdropUrl: String
    let id: Int
    let overview: String
    let posterUrl: String
    let releaseDate: String
    let title: String
}
