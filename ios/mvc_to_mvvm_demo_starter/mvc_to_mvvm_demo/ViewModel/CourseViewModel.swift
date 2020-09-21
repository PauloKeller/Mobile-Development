//
//  CourseViewModel.swift
//  mvc_to_mvvm_demo
//
//  Created by Brian Voong on 7/3/18.
//  Copyright © 2018 Brian Voong. All rights reserved.
//

import Foundation
import UIKit

struct CourseViewModel {
    
    let name: String
    
    let detailTextString: String
    let accessoryType: UITableViewCellAccessoryType
    
    // Dependency Injection (DI)
    init(course: Course) {
        self.name = course.name
        
        if course.number_of_lessons > 35 {
            detailTextString = "Lessons 30+ Check it Out!"
            accessoryType = .detailDisclosureButton
        } else {
            detailTextString = "Lessons: \(course.number_of_lessons)"
            accessoryType = .none
        }
    }
    
}
