//
//  CustomTabSwitcher.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/31/21.
//

import SwiftUI

struct CustomTabSwitcher: View {
    @State private var currentTab: CustomTab = .episodes
    
    var tabs: [CustomTab]
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            // Scrollable Custom Tab Picker
            TabPicker(tabs: tabs, currentTab: $currentTab)
            
            // Selected View
            switch currentTab {
            case .episodes:
                Text("Episodes")
            case .trailers:
                TrailersMoreView(trailers: movie.trailers)
            case .more:
                MoreLikeView(movies: movie.moreLikeThisMovie)
            }
        }
        .foregroundColor(.white)
    }
}


enum CustomTab: String {
    case episodes = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}

struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            CustomTabSwitcher(tabs: [.episodes, .trailers, .more], movie: exampleMovie1)
        }
    }
}

struct TabPicker: View {
    let tabs: [CustomTab]
    @Binding var currentTab: CustomTab
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { value in
                HStack(spacing: 20) {
                    ForEach(tabs, id: \.self) { tab in
                        VStack {
                            Rectangle()
                                .frame(width: widthForTab(tab), height: 6)
                                .foregroundColor(tab == currentTab ? .red: .clear)
                            Button {
                                currentTab = tab
                                value.scrollTo(tab, anchor: .trailing)
                            } label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(tab == currentTab ? .white: .gray)
                                
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(height: 30)
                        }
                        .id(tab)
                    }
                }
            }
        }
    }
    
    
    func widthForTab(_ tab: CustomTab) -> CGFloat {
        return tab.rawValue.widthForString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }
}
