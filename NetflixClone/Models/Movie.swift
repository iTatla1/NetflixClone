//
//  Movie.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/28/21.
//

import Foundation

struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    
    var categories: [String]
}
