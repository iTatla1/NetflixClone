//
//  ComingSoonView.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/8/22.
//

import SwiftUI

struct ComingSoonView: View {
    @State private var showNotificationList: Bool = false
    @State private var movieDetailToShow: Movie?
    @ObservedObject var vm = ComingSoonVM()
    @State private var scrollOffset: CGFloat = 0.0
    @State private var activeIndex: Int = 0
    
    func updateActiveindex(fromScroll scroll: CGFloat) {
        if scroll < 105 {
            activeIndex = 0
        }
        else {
            let remove105 = scroll - 105
            activeIndex = Int(remove105 / 410) + 1
        }
    }
    
    
    var body: some View {
        let movies = vm.movies.enumerated().map { $0 }
        let scrollTracingBinding = Binding {
            scrollOffset
        } set: { newValue in
            scrollOffset = newValue
            updateActiveindex(fromScroll: newValue)
        }

        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                TrackableScrollView(.vertical, showIndicators: false, contentOffset: scrollTracingBinding) {
                    LazyVStack {
                        NavigationLink(destination: Text("Notification List"), isActive: $showNotificationList) {
                            NotificationBar(showNotificationList: $showNotificationList)
                        }
                       
                        ForEach(Array(movies), id: \.offset) { index, movie in
                            ComingSoonRow(movie: movie, movieToShow: $movieDetailToShow)
                                .frame(height: 400)
                                .overlay (
                                    Group {
                                        index == activeIndex ? Color.clear : Color.black.opacity(0.8)
                                    }
                                        .animation(.easeInOut)
                                )
                        }
                    }
                    .foregroundColor(.white)
                }
            }
            .navigationBarHidden(true)
                        
        }
    }
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonView()
    }
}
