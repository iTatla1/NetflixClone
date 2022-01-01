//
//  TrailersMoreView.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/1/22.
//

import SwiftUI

struct TrailersMoreView: View {
    var trailers: [Trailer]
    let screen = UIScreen.main.bounds
    var body: some View {
            VStack {
                ForEach(trailers) { trailer in
                    LazyVStack (alignment: .leading) {
                        VideoPreviewImage(imageURL: trailer.thumbnailImageURL, videoURL: trailer.videoURL)
                            .frame(maxWidth: screen.width, maxHeight: 250 )
                            .clipped()
                        
                        Text(trailer.name)
                    }
                    .foregroundColor(.white)

                    .padding(.bottom, 10)
                }
            }
        
    }
}

struct TrailersMoreView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            TrailersMoreView(trailers: exampleTrailers)
        }
    }
}
