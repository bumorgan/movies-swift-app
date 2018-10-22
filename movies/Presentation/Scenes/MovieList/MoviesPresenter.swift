//
//  MoviesPresenter.swift
//  movies
//
//  Created by Bruno Morgan on 05/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import Foundation
import Moya
import RxMoya
import RxSwift

class MoviesPresenter {
    let moviesView: MoviesView
    var disposables: CompositeDisposable = CompositeDisposable()
    let movieRepository = MovieRepository()
    
    init(moviesView: MoviesView) {
        self.moviesView = moviesView
        self.setupObservables()
    }
    
    func setupObservables() {
        moviesView.onTryAgain.subscribe(onNext: {
            self.moviesView.hideEmptyState()
            self.getMovieSummaryList()
        })
        moviesView.onViewLoaded.subscribe(onNext: {
            self.getMovieSummaryList()
        })
        moviesView.onMovieSelected.subscribe(onNext: { (movie) in
            self.moviesView.displayMovieDetail(id: movie.id)
        })
    }
    
    func dispose() {
        disposables.dispose()
        disposables = CompositeDisposable()
    }
    
    func getMovieSummaryList() -> Void {
        
        self.moviesView.displayLoading()
        let disposable = movieRepository.getMovieSummaryList().subscribe(onSuccess: { response in
            if let movies = try? response {
                self.moviesView.displayMoviesView(movies: movies)
                self.moviesView.hideLoading()
            }
        }) { error in
            self.moviesView.hideLoading()
            self.moviesView.displayEmptyState()
        }
        
        //provider.rx.request(.movies) é o seu OBSERVABLE do tipo RESPONSE
        // as funções que você passou no subscribe (onSuccess e onError) são as funções que você quer que o Observer (que ele cria internamente) chame pra você
        // diposableSSSSS é a sua pastinha de "contratos"
        // disposable é o contrato da inscrição que você fez no OBSERVABLE
        disposables.insert(disposable)
    }
}
