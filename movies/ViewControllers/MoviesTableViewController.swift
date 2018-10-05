//
//  MoviesTableViewController.swift
//  movies
//
//  Created by Bruno Morgan on 02/10/18.
//  Copyright © 2018 Bruno Morgan. All rights reserved.
//

import UIKit
import Moya
import Kingfisher

class MoviesTableViewController: UITableViewController {
    
    var movies: [MovieRM]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let provider = MoyaProvider<MovieApi>()
        provider.request(.movies) { (result) in
            switch result {
            case .success(let response):
                self.movies = try? response.map([MovieRM].self)
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)

        cell.textLabel?.text = "\(self.movies?[indexPath.row].title ?? "No title") (\(self.movies?[indexPath.row].releaseDate.components(separatedBy: "-")[0] ?? "????"))"
        cell.detailTextLabel?.text = "Vote average: \(self.movies?[indexPath.row].voteAverage ?? 0)"

        let url = URL (string: self.movies?[indexPath.row].posterUrl ?? "")
        cell.imageView?.kf.setImage(with: url)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Movies"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let controller = segue.destination as! MovieViewController
            controller.selectedMovie = movies?[indexPath.row]
        }
    }

}
