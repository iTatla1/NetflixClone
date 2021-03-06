//
//  HomeStack.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/6/22.
//

import Foundation
import SwiftUI

struct HomeStack: View {
    @Binding var movieDetailsToShow: Movie?
    var typeRowSelection: HomeTopRow
    var genere: HomeGenere
    var vm: HomeVM
    
    var body: some View {
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
                        ForEach(vm.getMovies(category, andHomeRow: typeRowSelection, andGenere: genere)) { movie in
                            StandardMovieView(movie: movie)
                                .frame(width: 135, height: 200)
                                .onTapGesture {
                                    movieDetailsToShow = movie
                                }
                        }
                    }
                }
            }
            .padding(.leading, 6)
            .padding(.bottom, 16)
        }
    }
}

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                HomeStack(movieDetailsToShow: .constant(nil), typeRowSelection: .home, genere: .AllGenere, vm: HomeVM())
            }
        }
        .foregroundColor(.white)
    }
}
