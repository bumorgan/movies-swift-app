//
//  MovieView.swift
//  movies
//
//  Created by Bruno Morgan on 05/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import Foundation

protocol MovieView {
    func displayMovieView(movie: MovieDetails)
    func displayLoading()
    func hideLoading()
    func displayEmptyState()
}
