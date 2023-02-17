//
//  Course.swift
//  MVC
//
//  Created by Brian Voong on 6/30/18.
//  Copyright © 2018 Brian Voong. All rights reserved.
//

import Foundation

struct Course: Decodable {
    let id: Int
    let name: String
    let number_of_lessons: Int
}
