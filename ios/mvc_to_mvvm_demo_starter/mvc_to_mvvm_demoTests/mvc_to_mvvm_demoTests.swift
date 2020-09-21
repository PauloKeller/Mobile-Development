//
//  mvc_to_mvvm_demoTests.swift
//  mvc_to_mvvm_demoTests
//
//  Created by Brian Voong on 7/3/18.
//  Copyright © 2018 Brian Voong. All rights reserved.
//

import XCTest
@testable import mvc_to_mvvm_demo

class mvc_to_mvvm_demoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCourseViewModel() {
        let course = Course(id: 0, name: "My Course Name", number_of_lessons: 10)
        let courseViewModel = CourseViewModel(course: course)
        
        // what is it that we want to test?
        XCTAssertEqual(course.name, courseViewModel.name)
        XCTAssertEqual("Lessons: \(course.number_of_lessons)", courseViewModel.detailTextString)
        XCTAssertEqual(.none, courseViewModel.accessoryType)
    }
    
    func testCourseViewModelLessonsOverThreshold() {
        let course = Course(id: 0, name: "My Course Name", number_of_lessons: 100)
        let courseViewModel = CourseViewModel(course: course)
        
        XCTAssertEqual("Lessons 30+ Check it Out!", courseViewModel.detailTextString)
        XCTAssertEqual(.detailDisclosureButton, courseViewModel.accessoryType)
    }
    
    
    
    
    
    
    
    
    
    
    
}
