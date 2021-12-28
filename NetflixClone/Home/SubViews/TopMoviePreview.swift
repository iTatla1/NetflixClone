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
                HStack {
                    Text("My list")
                    Text("Play Button")
                    Text("Info")

                }
            }
        }
        .foregroundColor(.white)
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie1)
    }
}
