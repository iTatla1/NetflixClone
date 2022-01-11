//
//  PreviewList.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/11/22.
//

import SwiftUI
import simd

struct PreviewList: View {
    let movies: [Movie]
    @Binding var currentSelection: Int
    @Binding var isVisible: Bool
    @State private var currentTraslation: CGFloat = .zero
    let screen = UIScreen.main.bounds
    
    func shouldPlayVideo(_ index: Int) -> Bool {
        if !isVisible || index != currentSelection {
            return false
        }
        return true
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            PagerView(pageCount: movies.count, currentIndex: $currentSelection, translation: $currentTraslation) {
                ForEach(0..<movies.count) {index in
                    let movie = movies[index]
                    PreviewView(vm: PreviewVM(movie: movie), playVideo: shouldPlayVideo(index))
                        .frame(width: screen.size.width)
                }
            }
            .frame(width: screen.size.width)

        }
    }
}

struct ExamplePreviewList: View {
    @State private var currentSelection: Int = 0
    @State private var isVisible: Bool = true

    var body: some View {
        PreviewList(movies: exampleMovies, currentSelection: $currentSelection, isVisible: $isVisible)
    }
}

struct PreviewList_Previews: PreviewProvider {
    static var previews: some View {
        ExamplePreviewList()
    }
}
