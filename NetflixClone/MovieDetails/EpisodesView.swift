//
//  EpisodesView.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/1/22.
//

import SwiftUI

struct EpisodesView: View {
    @Binding var showSeasonPicker: Bool
    @Binding var currentSeason: Int
    
    func seasonEpisodes(_ season: Int) -> [Episode] {
        return episodes.filter{$0.season == season}
    }
    
    
    
    let episodes: [Episode]
    var body: some View {
        VStack(spacing: 14) {
            //Season Pikcer
            HStack {
                Button {
                    print("Toggling Pikcer")
                    showSeasonPicker.toggle()
                } label: {
                    Group {
                        Text("Season \(currentSeason)")
                        Image(systemName: "chevron.down")
                    }
                    .font(.system(size: 16))
                }

                Spacer()
            }
            
            // Episode List
            
            ForEach(seasonEpisodes(currentSeason), id: \.id) {episode in
                VStack(alignment: .leading) {
                    HStack {
                        VideoPreviewImage(imageURL: episode.thumbnailURL, videoURL: episode.videoURL)
                            .frame(width: 120, height: 70)
                            .clipped()
                        VStack(alignment: .leading) {
                            Text("\(episode.episodeNumber). \(episode.name)")
                                .font(.system(size: 15))
                                .bold()
                            Text("\(episode.length)m")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Button {
                            //
                        } label: {
                            Image(systemName: "arrow.down.to.line.alt")
                                .font(.system(size: 20))
                        }
                        
                    }
                    
                    Text(episode.description)
                        .font(.system(size: 13))
                        .lineLimit(3)
                }
                .padding(.bottom, 20)
                
            }
            
            Spacer()
        }
        .foregroundColor(.white)
        .padding(.horizontal, 20)
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            EpisodesView(showSeasonPicker: .constant(false), currentSeason: .constant(1), episodes: exampleEpisodes)
        }
    }
}
