//
//  MovieApi.swift
//  movies
//
//  Created by Bruno Morgan on 02/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import Foundation
import Moya

enum MovieApi {
    case movie(id: Int)
    case movies
}

extension MovieApi: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://desafio-mobile.nyc3.digitaloceanspaces.com/")!
    }
    
    var path: String {
        switch self {
        case .movie(let id):
            return "movies/\(id)"
        case .movies:
            return "movies"
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
}
