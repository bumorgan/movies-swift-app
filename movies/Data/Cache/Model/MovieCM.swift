//
//  MovieCM.swift
//  movies
//
//  Created by Bruno Morgan on 19/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//
import SwiftyUserDefaults

struct MovieCM: Codable, DefaultsSerializable {
    
    let id: Int
    let voteAverage: Float
    let title: String
    let posterUrl: String
    let genres: [String]
    let releaseDate: String
}
