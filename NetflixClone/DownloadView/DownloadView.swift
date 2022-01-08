//
//  DownloadView.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/8/22.
//

import SwiftUI

struct DownloadView: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Image(systemName: "info.circle")
                    Text("Smart Downloads")
                    Text("ON")
                        .foregroundColor(.blue)
                    Spacer()

                }
                .padding()
                .font(.system(size: 18, weight: .bold))
                
                ZStack {
                    Circle()
                        .foregroundColor(.graySearchBackground)
                        .padding(.horizontal, 100)
                    
                    Image(systemName: "arrow.down.to.line.alt")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 75)
                        .foregroundColor(.gray)
                }
                .frame(height: 275)
                .padding(.top, 50)
                
                VStack(spacing: 20) {
                    Text("Never be without Netflix")
                        .font(.title2)
                        .bold()
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce euismod in purus sit amet ullamcorper. Morbi efficitur fermentum congue. Pellentesque.")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Button {
                        //
                    } label: {
                        Text("See what you can download")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                    }

                }
                
                
                Spacer()
            }
            .foregroundColor(.white)
        }
        
        
    }
}

struct DownloadView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            DownloadView()
        }
    }
}
