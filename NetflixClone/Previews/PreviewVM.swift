//
//  PreviewVM.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/11/22.
//

import Foundation

class PreviewVM: ObservableObject {
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
