//
//  TrailerPlayerView.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/11/22.
//

import SwiftUI
import VideoPlayer

struct TrailerPlayerView: View {
    let videoURL: URL?
    @Binding var playVideo: Bool
    
    var body: some View {
        if let url = videoURL {
            VideoPlayer(url: url, play: $playVideo)
        }
        else {
            VStack(spacing: 24) {
                Spacer()
                Image(systemName: "xmark.octagon")
                    .font(.system(size: 48))
                Text("Could not load URL")
                    .font(.title3)
                    .bold()
                Spacer()

            }
            .foregroundColor(.white)
        }
    }
}

struct TrailerPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerPlayerView(videoURL: URL(string: "https://any-url.com")!, playVideo: .constant(false))
    }
}
