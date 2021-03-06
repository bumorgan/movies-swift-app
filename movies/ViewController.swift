//
//  ViewController.swift
//  movies
//
//  Created by Bruno Morgan on 02/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let provider = MoyaProvider<MovieApi>()
        provider.request(.movies) { (result) in
            switch result {
            case .success(let response):
                let movies = try? response.map([MovieRM].self)
                //print(movies!)
            case .failure(let error):
                print(error)
            }
        }
    }
}
