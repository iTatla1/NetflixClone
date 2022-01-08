//
//  ComingSoonVM.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/8/22.
//

import Foundation

class ComingSoonVM: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        movies = generateMovies(20)
    }
}
