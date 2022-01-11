//
//  PreviewView.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/11/22.
//

import SwiftUI

struct PreviewView: View {
    @ObservedObject var vm: PreviewVM
    let playVideo: Bool
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            TrailerPlayerView(videoURL: vm.movie.previewVideoURL, playVideo: .constant(playVideo))
            
            VStack {
                HStack {
                    Text(vm.movie.name)
                        .bold()
                        .font(.largeTitle)
                    
                    Spacer()
                }
                .padding(.leading, 24)
                .padding(.top, 60)
                
                Spacer()
                
                HStack {
                    ForEach(0..<vm.movie.categories.count, id: \.self) { index in
                        HStack {
                            Text(vm.movie.categories[index])
                                .font(.footnote)
                            
                            if (index != vm.movie.categories.count - 1) {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 3))
                            }
                           
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    SmallVerticalButton(text: "My List",
                                        isOnImage: "checkmark",
                                        isOffImage: "plus",
                                        isOn: true,
                                        color: vm.movie.accentColor) {
                        //
                    }
                    Spacer()

                    Button {
                        //
                    } label: {
                        HStack {
                            Image(systemName: "play.fill")
                            Text("Play")
                                .fontWeight(.heavy)
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 26)
                        .border(vm.movie.accentColor ?? .white, width: 3)
                    }
                    Spacer()

                    SmallVerticalButton(text: "Inf",
                                        isOnImage: "info.circle",
                                        isOffImage: "info.circle",
                                        isOn: true,
                                        color: vm.movie.accentColor) {
                        //
                    }
                    Spacer()


                }
                .padding(.top, 12)

            }
            .foregroundColor(vm.movie.accentColor)
            .padding(.bottom, 48)


        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView(vm: PreviewVM(movie: exampleMovie1), playVideo: true)
    }
}
