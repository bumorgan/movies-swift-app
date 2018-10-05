//
//  NetworkManager.swift
//  movies
//
//  Created by Bruno Morgan on 02/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import Foundation
import Moya

extension MovieApi: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://desafio-mobile.nyc3.digitaloceanspaces.com/movies") else {fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        get
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        <#code#>
    }
    
    var task: Task {
        <#code#>
    }
    
    var headers: [String : String]? {
        <#code#>
    }
}
