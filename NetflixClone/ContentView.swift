//
//  ContentView.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/28/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
                HomeView()
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
            
            Text("Downloads")
                .tabItem {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("Downloads")
                }
                .tag(3)
            Text("More")
                .tabItem {
                    Image(systemName: "line.3.horizontal")
                    Text("More")
                }
                .tag(4)
        }
        .onAppear {
            UITabBar.appearance().isTranslucent = false
            UITabBar.appearance().barTintColor = .black
        }
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
