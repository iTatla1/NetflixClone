//
//  SearchView.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/7/22.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var vm: SearchVM = SearchVM()
    @State private var text: String = ""
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(text: $text, isLoading: $vm.isLoading)
                Spacer()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
