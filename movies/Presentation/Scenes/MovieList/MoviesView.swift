//
//  MoviesView.swift
//  movies
//
//  Created by Bruno Morgan on 05/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import Foundation
import RxSwift

protocol MoviesView {
    func displayMoviesView(movies: [Movie])
    func displayLoading()
    func hideLoading()
    func displayEmptyState()
    func hideEmptyState()
    func displayMovieDetail(id: Int)
    
    var onTryAgain: Observable<()> { get }
    var onViewLoaded: Observable<()> { get }
    var onMovieSelected: Observable<Movie> { get }
}
