//
//  SearchBar.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/7/22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing: Bool = true
    @Binding var isLoading: Bool
    
    var body: some View {
        
        HStack(spacing: 14) {
            ZStack(alignment: .leading) {
                Color.graySearchBackground
                    .cornerRadius(8)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.graySearchText)
                        .padding(.leading, 10)
                    
                    TextField("Search", text: $text)
                        .padding(7)
                        .padding(.leading, -7)
                        .padding(.horizontal, 10)
                        .background(Color.graySearchBackground)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .onTapGesture {
                            isEditing = true
                        }
                    
                    if (!text.isEmpty) {
                        if isLoading {
                            Button {
                                text = ""
                            } label: {
                                ActivityIndicator(style: .medium, animate: .constant(true))
                                    .configure {
                                        $0.color = .white
                                    }
                            }
                            .frame(width: 35, height: 35)
                            
                            
                        } else {
                            Button {
                                text = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")               .foregroundColor(.graySearchText)
                                    .frame(width: 35, height: 35)
                            }
                        }
                    }
                }
            }
            
            if isEditing {
                Button {
                    text = ""
                    isEditing = false
                    hideKeyBoard()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.white)
                }
            }
        }
        .frame(height: 36)
        .padding(.horizontal, 8)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            SearchBar(text: .constant(""), isLoading: .constant(false))
        }
    }
}
