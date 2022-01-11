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
    @State private var verticalDragIsActive = false
    let externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>
    
    let content: Content
    
    init(
        pageCount: Int,
        currentIndex: Binding<Int>,
        translation: Binding<CGFloat>,
        externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>,
        @ViewBuilder content: () -> Content
    ) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self._translation = translation
        self.externalDragGesture = externalDragGesture
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
                externalDragGesture.simultaneously(with: DragGesture(minimumDistance: 20)
                                                    .onChanged({ value in
                                                        if verticalDragIsActive {return}
                                                        
                                                        if abs(value.translation.height) > abs(value.translation.width) {
                                                            if abs(value.translation.width) < 30 {
                                                                verticalDragIsActive = true
                                                                return
                                                            }
                                                        }
                                                        
                                                        translation = value.translation.width
                                                    })
                                                    .onEnded({ value in
                                                        if verticalDragIsActive {
                                                            verticalDragIsActive = false
                                                            return
                                                        }
                                                        
                                                        let offset = value.translation.width / geo.size.width
                                                        let newIndex = (CGFloat(currentIndex) - offset).rounded()
                                                        currentIndex = min(max(0,Int(newIndex)), pageCount - 1)
                                                        translation = .zero
                                                        
                                                    })
                                                  )
            )
            .animation(.interactiveSpring())
        }
    }
}

//struct PagerDummy: View {
//    @State private var currentIndex: Int = 0
//    @State private var translation: CGFloat = .zero
// 
//    var body: some View {
//        PagerView(pageCount: 3, currentIndex: $currentIndex, translation: $translation, content:  {
//            Color.red
//            Color.blue
//            Color.black
//        })
//    }
//}
//
//struct PagerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PagerDummy()
//    }
//}
