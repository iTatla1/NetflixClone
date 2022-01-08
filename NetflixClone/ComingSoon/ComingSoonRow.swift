//
//  ComingSoonRow.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/8/22.
//

import SwiftUI
import Kingfisher

struct ComingSoonRow: View {
    let movie: Movie
    @Binding var movieToShow: Movie?
    let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            Color.blue
                .frame(height: 200)
            
            VStack {
                HStack {
                    KFImage(movie.thumbnailURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screen.size.width/3, height: 75)
                        .clipped()
                    
                    Spacer()
                    Button {
                        //
                    } label: {
                        VStack(spacing: 6) {
                            Image(systemName: "bell")
                                .font(.title3)
                            Text("Remind Me")
                        }
                    }
                    .padding(.horizontal)

                    Button {
                        //
                    } label: {
                        VStack(spacing: 6) {
                            Image(systemName: "info.circle")
                                .font(.title3)
                            Text("Info")
                        }
                    }
                    .font(.caption)
                    .padding(.trailing, 24)

                }
                VStack(alignment: .leading) {
                    Text(movie.name)
                        .font(.title2)
                        .bold()
                    Text(movie.episodeDescriptionDisplay)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
            }
            .padding(.horizontal)
        }
        .foregroundColor(.white)
    }
}

struct ComingSoonRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ComingSoonRow(movie: exampleMovie1, movieToShow: .constant(nil))
        }
    }
}
