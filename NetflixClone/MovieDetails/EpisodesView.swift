//
//  EpisodesView.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/1/22.
//

import SwiftUI

struct EpisodesView: View {
    @Binding var showSeasonPicker: Bool
    let episodes: [Episode]
    var body: some View {
        VStack {
            //Season Pikcer
            HStack {
                Button(action: {
                    showSeasonPicker.toggle()
                }) {
                    Group {
                        Text("Season 1")
                        Image(systemName: "chevron.down")
                    }
                    .font(.system(size: 16))
                }
                Spacer()
            }
            
            ForEach(episodes, id: \.id) {episode in
                Text("Test")
            }
            
            Spacer()
        }
        .foregroundColor(.white)
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            EpisodesView(showSeasonPicker: .constant(false), episodes: exampleEpisodes)
        }
    }
}
