//
//  MovieDetails.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/30/21.
//

import SwiftUI

struct MovieDetails: View {
    let movie: Movie
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack{
                    Spacer()
                    Button {
                        //
                    } label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 28))
                    }
                }
                .padding(.horizontal, 22)
                .zIndex(1)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack (){
                        StandardMovieView(movie: movie)
                            .frame(width: screen.width / 2.5)
                        
                        MovieInfoSubHeadline(movie: movie)
                        
                        if movie.promotionHeadLine != nil {
                            Text(movie.promotionHeadLine!)
                                .bold()
                                .font(.headline)
                        }
                        
                        PlayButton(text: "Play", image: "play.fill", action: {
                            //
                        }, backgroundColor: .red)
                        
                        CurrentEpisodeInformation(movie: movie)
                        
                        CastInfo(movie: movie)
                        
                        MovieActionButtons()
                        
                        CustomTabSwitcher(tabs: [.episodes, .trailers, .more], movie: exampleMovie4)
                        
                    }
                    .padding(.horizontal, 10)
                }
                
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails(movie: exampleMovie6)
    }
}


struct MovieInfoSubHeadline: View {
    let movie: Movie
        
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            Text("\(movie.year)")
            
            RatingView(rating: movie.rating)
            
            Text(movie.numOfSeasonsDispaly)
            
            QualityView(quality: movie.quality)
        }
        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    let rating: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
        }
        .frame(width: 50, height: 20)
    }
}

struct QualityView: View {
    let quality: String
    var body: some View {
        Text(" \(quality) ")
            .font(.system(size: 14))
            .bold()
            .foregroundColor(.white)
            .overlay(Rectangle().stroke(style: StrokeStyle(lineWidth: 2)).foregroundColor(.gray))
            .frame(width: 35, height: 20)

    }
}

struct CastInfo: View {
    let movie: Movie
    var body: some View {
        VStack(spacing: 3) {
            HStack{
                Text("Cast: \(movie.cast)")
                Spacer()
            }
            
            HStack{
                Text("Creators: \(movie.creators)")
                Spacer()
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.vertical, 10)
    }
}

struct CurrentEpisodeInformation: View {
    let movie: Movie
    var body: some View {
        Group {
            HStack {
                Text(movie.episodeInfoDisplay)
                    .bold()
                Spacer()
            }
            .padding(.vertical, 4)
            
            HStack {
                Text(movie.episodeDescriptionDisplay)
                    .font(.subheadline)
                Spacer()
            }
        }
    }
}

struct MovieActionButtons: View {
    var body: some View {
        HStack(alignment: .bottom, spacing: 60) {
            SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                //
            }
            
            SmallVerticalButton(text: "Rate", isOnImage: "hand.thumbsup.fill", isOffImage: "hand.thumbsup", isOn: true) {
                //
            }
            
            SmallVerticalButton(text: "Share", isOnImage: "square.and.arrow.up", isOffImage: "square.and.arrow.up", isOn: true) {
                //
            }
            
            Spacer()
        }
        .padding(.leading, 20)
    }
}
