//
//  ContentView.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/28/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var previewShowFullScreen = false
    @State private var previewStartIndex = 0
    @State private var previewPOS: CGFloat = 1000
    @State private var previewNewPOS: CGFloat = 1000
    
    @State private var previewhorizontalDragGestureActive: Bool  = false
    let screen = UIScreen.main.bounds
    
    var body: some View {
        
        let previewDragGesture = DragGesture(minimumDistance: 20)
            .onChanged { value in
                if previewhorizontalDragGestureActive {return}
                
                if previewPOS == .zero {
                    if abs(value.translation.width) > abs(value.translation.height) {
                        previewhorizontalDragGestureActive = true
                        return
                    }
                }
                
                // Vertical Only
                
                let shouldbePosition = value.translation.height + self.previewNewPOS
                
                if shouldbePosition < 0 {
                    return
                } else {
                    previewPOS = shouldbePosition
                }
            }
            .onEnded { value in
                if previewhorizontalDragGestureActive {
                    previewhorizontalDragGestureActive = false
                    return
                }
                
                let shouldbePosition = value.translation.height + self.previewNewPOS
                
                if shouldbePosition < 0 {
                    previewPOS = .zero
                    previewNewPOS = .zero
                    
                } else {
                    let closingPoint = screen.size.height * 0.2
                    if shouldbePosition > closingPoint {
                        withAnimation {
                            self.previewShowFullScreen = false
                            previewPOS = screen.height + 20
                            previewNewPOS = screen.height + 20
                        }
                    }
                    else {
                        withAnimation {                            previewPOS = .zero
                            previewNewPOS = .zero
                        }
                    }
                }
                previewhorizontalDragGestureActive = false
            }
        
        return ZStack {
            TabView {
                HomeView(previewShowFullScreen: $previewShowFullScreen, previewStartIndex: $previewStartIndex)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(0)
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    .tag(1)
                
                ComingSoonView()
                    .tabItem {
                        Image(systemName: "play.rectangle")
                        Text("Coming Soon")
                    }
                    .tag(2)
                
                DownloadView()
                    .tabItem {
                        Image(systemName: "arrow.down.to.line.alt")
                        Text("Downloads")
                    }
                    .tag(3)
            }
            .onAppear {
                UITabBar.appearance().isTranslucent = false
                UITabBar.appearance().barTintColor = .black
            }
            .accentColor(.white)
            
            
            PreviewList(movies: exampleMovies, currentSelection: $previewStartIndex, isVisible: $previewShowFullScreen, externalDragGesture: previewDragGesture)
                .offset(y: previewPOS)
                .isHidden(!previewShowFullScreen)
                .animation(.easeIn)
                .transition(.move(edge: .bottom))
        }
        .onChange(of: previewShowFullScreen) { value in
            if value {
                withAnimation {
                    previewPOS = .zero
                    previewNewPOS = .zero
                }
            }
            else {
                withAnimation {
                    previewPOS = screen.size.height + 20
                    previewNewPOS = screen.size.height + 20
                    
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
