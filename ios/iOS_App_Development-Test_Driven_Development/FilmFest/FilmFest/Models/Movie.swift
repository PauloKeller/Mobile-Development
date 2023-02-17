//
//  Movie.swift
//  FilmFest
//
//  Created by Paulo Vinicius Keller on 11/11/22.
//

import Foundation

struct Movie {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}

extension Movie: Equatable {
    static func==(lhs: Movie, rhs: Movie) -> Bool {
        return lhs.title == rhs.title && lhs.releaseDate == rhs.releaseDate
    }
}
