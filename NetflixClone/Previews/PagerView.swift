//
//  PagerView.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/10/22.
//

import SwiftUI

struct PagerView<Content: View>: View {
    let pageCount: Int
    @Binding var currentIndex: Int
    @Binding var translation: CGFloat
    let content: Content
    
    init(
        pageCount: Int,
        currentIndex: Binding<Int>,
        translation: Binding<CGFloat>,

        @ViewBuilder content: () -> Content
    ) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self._translation = translation
        self.content = content()
        
    }
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                self.content
                    .frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, alignment: .leading)
            .offset(x: -(geo.size.width * CGFloat(currentIndex)))
            .offset(x: self.translation)
            .gesture(
            DragGesture()
                .onChanged({ value in
                    translation = value.translation.width
                })
                .onEnded({ value in
                    let offset = value.translation.width / geo.size.width
                    let newIndex = (CGFloat(currentIndex) - offset).rounded()
                    currentIndex = min(max(0,Int(newIndex)), pageCount - 1)
                    translation = .zero
                    
                })
            )
            .animation(.interactiveSpring())
        }
    }
}

struct PagerDummy: View {
    @State private var currentIndex: Int = 0
    @State private var translation: CGFloat = .zero
 
    var body: some View {
        PagerView(pageCount: 3, currentIndex: $currentIndex, translation: $translation, content:  {
            Color.red
            Color.blue
            Color.black
        })
    }
}

struct PagerView_Previews: PreviewProvider {
    static var previews: some View {
        PagerDummy()
    }
}
