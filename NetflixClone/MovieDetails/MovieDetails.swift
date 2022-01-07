//
//  MovieDetails.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/30/21.
//

import SwiftUI

struct MovieDetails: View {
    let movie: Movie
    @Binding var movieDetailsToShow: Movie?
    let screen = UIScreen.main.bounds
    
    @State private var showSeasonPicker = false {
        didSet {
            print("Picker Toggled \(showSeasonPicker)")
        }
    }
    @State private var selectedSeason = 1
    
    func getEpisodesForSeason() -> [Episode] {
        return movie.episode?.filter {$0.season == selectedSeason} ?? []
    }
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                VStack {
                    HStack{
                        Spacer()
                        Button {
                            movieDetailsToShow = nil
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
                                .frame(width: screen.width / 2.5, height: 200)
                            
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
                            
                            CustomTabSwitcher(showPicker: $showSeasonPicker, currentSeason: $selectedSeason, tabs: [.episodes, .trailers, .more], movie: movie)
           
                            
                        }
                        .padding(.horizontal, 10)
                    }
                    
                    Spacer()
                }
                .foregroundColor(.white)
                
                if showSeasonPicker {
                    Group{
                        Color.black.opacity(0.9)
                        
                        VStack(spacing: 40) {
                            Spacer()
                            
                            ForEach(0 ..< (movie.numberOfSeasons ?? 0)) {
                                season in
                                Button {
                                    selectedSeason  = season + 1
                                    showSeasonPicker.toggle()
                                } label: {
                                    Text("Season \(season + 1)")
                                        .foregroundColor((selectedSeason - 1) == season ? .white : .gray)
                                        .font((selectedSeason - 1) == season ? .headline : .subheadline)
                                        .padding(.bottom, 16)
                                }
                                
                            }
                            Spacer()
                            Button {
                                showSeasonPicker.toggle()
                            } label: {
                                Image(systemName: "x.circle.fill")
                                    .font(.system(size: 40))
                                    .scaleEffect(x: 1.1)
                            }
                            .padding(.bottom, 30)
                            
                        }
                        .foregroundColor(.white)
                    }
                    .edgesIgnoringSafeArea(.all)
                }
            }
        }
    }
}

struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails(movie: exampleMovie1, movieDetailsToShow: .constant(nil))
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
