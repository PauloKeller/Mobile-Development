//
//  File.swift
//  Quizzler
//
//  Created by Paulo Keller on 17/05/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        self.questionText = text
        self.answer = correctAnswer
    }
}


