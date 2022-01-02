//
//  TopMoviePreview.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/28/21.
//

import SwiftUI
import Kingfisher

struct TopMoviePreview: View {
    let movie: Movie
    @Binding var movieDetailsToShow: Movie?
    
    func isCategoryLast(_ cat: String) -> Bool {
        let catCount = movie.categories.count
        if let index = movie.categories.firstIndex(of: cat), index == catCount - 1 {
            return true
        }
        return false
    }
    
    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
            
            VStack {
                Spacer()
                HStack {
                    ForEach(movie.categories, id: \.self) {  category in
                        HStack {
                            Text(category)
                                .font(.footnote)
                            if !isCategoryLast(category) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                .padding(.bottom, 4)
                HStack {
                    Spacer()

                    SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                        //
                    }
                    Spacer()
                    PlayButton(text: "Play", image: "play.fill") {
                        //
                    }.frame(width: 120)
                    Spacer()

                    SmallVerticalButton(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", isOn: true) {
                        movieDetailsToShow = movie
                    }
                    Spacer()

                }
            }
            .background(
                LinearGradient.blackOpacityGradient.padding(.top, 250)
            )
        }
        .foregroundColor(.white)
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie4, movieDetailsToShow: .constant(nil))
    }
}
