//
//  StandardMovieView.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/28/21.
//

import SwiftUI
import Kingfisher

struct StandardMovieView: View {
    let movie: Movie
    
    var body: some View {
        GeometryReader { proxy in
            KFImage(movie.thumbnailURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: proxy.size.width, height: proxy.size.height)
                .clipped()
        }
    }
}

struct StandardMovieView_Previews: PreviewProvider {
    static var previews: some View {
        StandardMovieView(movie: exampleMovie1)
            .frame(width: 200, height: 300)
    }
}
