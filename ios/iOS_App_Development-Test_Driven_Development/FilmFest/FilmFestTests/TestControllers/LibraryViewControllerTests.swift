//
//  LibraryViewControllerTests.swift
//  FilmFestUITests
//
//  Created by Paulo Vinicius Keller on 11/14/22.
//

import XCTest

@testable import FilmFest
final class LibraryViewControllerTests: XCTestCase {
    
    var sut: LibraryViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerId") as? LibraryViewController
        
        _ = sut.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - Nil Checks
    
    func testLibraryVCTableViewShouldNotBeNil() {
        XCTAssertNotNil(sut.libraryTableView)
    }
    
    // MARK: - Data Source
    
    func testDataSourceViewDidLoadSetsTableViewDataSource() {
        XCTAssertNotNil(sut.libraryTableView.dataSource)
        XCTAssertTrue(sut.libraryTableView.dataSource is MovieLibraryDataService)
    }
    
    // MARK: - Delegate
    
    func testDelegateViewDidLoadSetsTableViewDelegate() {
        XCTAssertNotNil(sut.libraryTableView.delegate)
        XCTAssertTrue(sut.libraryTableView.delegate is MovieLibraryDataService)
    }
    
    // MARK: - Data Service Assumptions
    
    func testDataServiceViewDidLoadSingleDataServiceObject() {
        XCTAssertEqual(sut.libraryTableView.dataSource as! MovieLibraryDataService, sut.libraryTableView.delegate as! MovieLibraryDataService)
    }

}
