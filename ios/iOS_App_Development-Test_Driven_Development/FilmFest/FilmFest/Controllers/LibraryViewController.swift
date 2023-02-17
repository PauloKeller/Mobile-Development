//
//  ViewController.swift
//  FilmFest
//
//  Created by Paulo Vinicius Keller on 11/11/22.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet weak var dataService: MovieLibraryDataService!
    
    var movieManage = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
        
        dataService.movieManager = movieManage
        
//        dataService.movieManager?.addMovie(movie: Movie(title: "Action", releaseDate: "1999"))
//        dataService.movieManager?.addMovie(movie: Movie(title: "Horror", releaseDate: "1998"))
//        dataService.movieManager?.addMovie(movie: Movie(title: "Indie Comedy", releaseDate: "1979"))
//        dataService.movieManager?.addMovie(movie: Movie(title: "Crime Thriller", releaseDate: "1999"))
//        
//        libraryTableView.reloadData()
    }
}

