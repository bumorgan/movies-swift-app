//
//  MoviePresenter.swift
//  movies
//
//  Created by Bruno Morgan on 05/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import Foundation
import Moya
import RxMoya
import RxSwift

class MoviePresenter {
    let movieView: MovieView
    var disposables: CompositeDisposable = CompositeDisposable()
    
    init (movieView: MovieView) {
        self.movieView = movieView
    }
    
    func dispose() {
        disposables.dispose()
        disposables = CompositeDisposable()
    }
    
    func getMovieDetails(id: Int) -> Void {
        let provider = MoyaProvider<MovieApi>()
        self.movieView.displayLoading()
        
        let disposable = provider.rx.request(.movie(id: id)).subscribe(onSuccess: { response in
            if let movie = try? response.map(MovieDetailsRM.self) {
                self.movieView.hideLoading()
                self.movieView.displayMovieView(movie: movie)
            }
        }) { error in
            self.movieView.hideLoading()
            self.movieView.displayEmptyState()
        }
        
        //provider.rx.request(.movie(id: id)) é o seu OBSERVABLE do tipo RESPONSE
        // as funções que você passou no subscribe (onSuccess e onError) são as funções que você quer que o Observer (que ele cria internamente) chame pra você
        // diposableSSSSS é a sua pastinha de "contratos"
        // disposable é o contrato da inscrição que você fez no OBSERVABLE
        disposables.insert(disposable)
    }
}
