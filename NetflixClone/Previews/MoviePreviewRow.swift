//
//  MoviePreviewRow.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/10/22.
//

import SwiftUI

struct MoviePreviewRow: View {
    let movies: [Movie]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Previews")
                .font(.title3)
                .bold()
                .padding(.leading, 6)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<movies.count) { movieIndex in
                        let movie = movies[movieIndex]
                        MoviePreviewCell(movie: movie)
                            .frame(width: 120, height: 120)
                            .padding(.trailing, 14)
                            .padding(.leading, 6)
                    }
                }
            }
        }
        .foregroundColor(.white)
        .frame(height: 185)
    }
}

struct MoviePreviewRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            MoviePreviewRow(movies: exampleMovies)
        }
    }
}
