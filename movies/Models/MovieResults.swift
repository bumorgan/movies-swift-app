//
//  MovieResults.swift
//  movies
//
//  Created by Bruno Morgan on 02/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import Foundation

struct MovieResults {
    let numberOfResults: Int
    let movies: [Movie]
    
    enum ResultsCodingKeys: String, CodingKey {
        case numberOfResults
        case movies
    }
}
