//
//  MovieCellTests.swift
//  FilmFestTests
//
//  Created by Paulo Vinicius Keller on 11/15/22.
//

import XCTest

@testable import FilmFest
final class MovieCellTests: XCTestCase {
    
    var tableView: UITableView!
    var mockDataSource: MockCellDataSource!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerId") as! LibraryViewController
        _ = libraryVC.view
        
        tableView = libraryVC.libraryTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCellConfigShouldSetLabelsToMovieData() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellId", for: IndexPath(row: 0, section: 0)) as! MovieCell
        cell.configMovieCell(movie: Movie(title: "Indie Comedy", releaseDate: "2018"))
        
        XCTAssertEqual(cell.textLabel?.text, "Indie Comedy")
        XCTAssertEqual(cell.detailTextLabel?.text, "2018")
    }

}
