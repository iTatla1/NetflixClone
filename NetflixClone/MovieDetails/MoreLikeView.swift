//
//  MoreLikeView.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/1/22.
//

import SwiftUI

struct MoreLikeView: View {
    var movies: [Movie]
    let columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(movies) {movie in
                StandardMovieView(movie: movie)
            }
        }
    }
}

struct MoreLikeView_Previews: PreviewProvider {
    static var previews: some View {
        MoreLikeView(movies: exampleMovies)
    }
}
