//
//  Episode.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/30/21.
//

import Foundation

struct Episode: Identifiable {
    let id = UUID().uuidString
    let episodeNumber: Int
    let name: String
    let season: Int
    let thumbnailImageURLString: String
    let description: String
    let length: Int
    
    let videoURL: URL
    
    var thumbnailURL: URL {
        return URL(string: thumbnailImageURLString)!
    }
}
