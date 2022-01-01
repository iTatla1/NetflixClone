//
//  Trailer.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/1/22.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    let id = UUID().uuidString
    let name: String
    let videoURL: URL
    let thumbnailImageURL: URL
}
