//
//  MoviesTableViewAdapter.swift
//  movies
//
//  Created by Bruno Morgan on 05/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class MoviesTableViewAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    private var movies: [Movie] = []
    private let tableView: UITableView
    
    private let movieSelectedSubject: PublishSubject<Movie> = PublishSubject()
    var movieSelectedObservable: Observable<Movie> { return movieSelectedSubject }
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setData(movies: [Movie]){
        self.movies = movies
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = self.movies[indexPath.row]
        movieSelectedSubject.onNext(movie)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        cell.textLabel?.text = "\(self.movies[indexPath.row].title ?? "No title") (\(self.movies[indexPath.row].releaseDate.components(separatedBy: "-")[0] ?? "????"))"
        cell.detailTextLabel?.text = "Vote average: \(self.movies[indexPath.row].voteAverage ?? 0)"
        
        let url = URL (string: self.movies[indexPath.row].posterUrl ?? "")
        cell.imageView?.kf.setImage(with: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Movies"
    }
}
