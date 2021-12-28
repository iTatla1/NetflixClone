//
//  HomeView.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/28/21.
//

import SwiftUI

struct HomeView: View {
    var vm = HomeVM()
    
    var body: some View {
        ZStack{
            Color.black
            .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                
                // Main VStack
                LazyVStack {
                    ForEach(vm.allCategories, id: \.self) { category in
                        VStack {
                            HStack {
                                Text(category)
                                    .font(.title3)
                                    .bold()
                                Spacer()
                            }
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack{
                                    ForEach(vm.getMovies(category)) { movie in
                                        StandardMovieView(movie: movie)
                                            .frame(width: 100, height: 200)
                                            .padding(.horizontal, 20)
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 16)
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
