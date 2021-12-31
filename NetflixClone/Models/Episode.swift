//
//  Episode.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/30/21.
//

import Foundation

struct Episode: Identifiable {
    let id = UUID().uuidString
    let name: String
    let season: Int
    let thumbnailImageURLString: String
    let description: String
    let length: Int
    
    var thumbnailURL: URL {
        return URL(string: thumbnailImageURLString)!
    }
}
