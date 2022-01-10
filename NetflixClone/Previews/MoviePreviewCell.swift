//
//  MoviePreviewCell.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/10/22.
//

import SwiftUI
import Kingfisher

struct MoviePreviewCell: View {
    let movie: Movie
    let color: [Color] = [.yellow, .orange, .red, .gray, .pink, .green]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
            .overlay(Circle().stroke(lineWidth: 3).foregroundColor(color.randomElement()))
            
            Image(movie.previewImageName)
                .resizable()
                .scaledToFit()
                .offset(y: -20)
                .frame(height: 65)
        }
    }
}

struct MoviePreviewCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            MoviePreviewCell(movie: exampleMovie1)
                .frame(width: 165, height: 50)
        }
    }
}
