//
//  PopularMovieView.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/7/22.
//

import SwiftUI
import Kingfisher

struct PopularMovieView: View {
    let movie: Movie
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        GeometryReader { proxy in
            HStack {
                KFImage(movie.thumbnailURL)
                    .resizable()
                    .frame(width: proxy.size.width / 3)
                    .padding(.leading, 3)
                Text(movie.name)
                    .font(.body)
                    .foregroundColor(.graySearchText)
                    .lineLimit(1)
                Spacer()
                
                Button {
                    // Play movie
                } label: {
                    Image(systemName: "play.fill")
                        .font(.system(size: 22))
                        .padding(.trailing, 20)
                }
                
              
            }
            .foregroundColor(.white)
            .onTapGesture {
                movieDetailToShow = movie
            }
        }
    }
}

struct PopularMovieView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            PopularMovieView(movie: exampleMovie1, movieDetailToShow: .constant(nil))
                .frame(height: 75)

        }
    }
}
