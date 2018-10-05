//
//  MovieApiService.swift
//  movies
//
//  Created by Bruno Morgan on 05/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import Foundation
import Moya

class MoviesApiService {
    
    func getMoviesData() -> [MovieRM] {
        
        let provider = MoyaProvider<MovieApi>()
        provider.request(.movies) { (result) in
            switch result {
            case .success(let response):
                return try? response.map([MovieRM].self)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
