//
//  MoviesView.swift
//  movies
//
//  Created by Bruno Morgan on 05/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import Foundation


protocol MoviesView {
    func displayMoviesView(movies: [MovieRM])
    func displayLoading()
    func hideLoading()
    func displayEmptyState()
}
