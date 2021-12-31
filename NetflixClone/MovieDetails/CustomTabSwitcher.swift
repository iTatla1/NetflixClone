//
//  CustomTabSwitcher.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/31/21.
//

import SwiftUI

struct CustomTabSwitcher: View {
    var tabs: [CustomTab]
    
    func widthForTab(_ tab: CustomTab) -> CGFloat {
        return tab.rawValue.widthForString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // Scrollable Custom Tab Picker
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(tabs, id: \.self) { tab in
                        VStack {
                            Rectangle()
                                .frame(width: widthForTab(tab), height: 6)
                            Button {
                                //
                            } label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))

                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            
            // Selected View
            Text("Selected View")
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
            CustomTabSwitcher(tabs: [.episodes, .trailers, .more])
        }
    }
}
