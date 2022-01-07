//
//  SearchResultGrid.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/7/22.
//

import SwiftUI

struct SearchResultGrid: View {
    let movies: [Movie]
    @Binding var movieDetailsToShow: Movie?
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(movies, id: \.id) {movie in
                    StandardMovieView(movie: movie)
                        .frame(height: 160)
                        .onTapGesture {
                            movieDetailsToShow = movie
                        }
                }
                
            
        }
    }
}

struct SearchResultGrid_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultGrid(movies: generateMovies(20), movieDetailsToShow: .constant(nil))
    }
}
