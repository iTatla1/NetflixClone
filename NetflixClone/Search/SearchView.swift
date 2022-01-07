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
    @State private var movieDetailToShow: Movie? = nil
    
    var body: some View {
        
        let searchTextBinding = Binding  {
            return text
        } set: {
            text = $0
            vm.updatedSearchText(with: $0)
        }
        
        return ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(text: searchTextBinding, isLoading: $vm.isLoading)
                
                ScrollView {
                    if vm.isShowingPopularMovie {
                        PopularMoviesList(movies: vm.popularMovies, movieDetailToShow: $movieDetailToShow)
                    }
                    
                    if vm.viewState == .empty {
                        Text("Your search did not have any results.")
                            .bold()
                            .padding(.top, 150)
                    }
                    
                    else if vm.viewState == .ready && !vm.isShowingPopularMovie {
                        VStack(alignment: .leading) {
                            Text("Movies & TV")
                                .font(.body)
                                .bold()
                                .padding(.leading, 8)
                            
                            SearchResultGrid(movies: vm.searchMovie, movieDetailsToShow: $movieDetailToShow)
                            
                        }
                    }
                }
                
                
                Spacer()
            }
            
            if movieDetailToShow != nil {
                MovieDetails(movie: movieDetailToShow!, movieDetailsToShow: $movieDetailToShow )
                    .animation(.easeIn)
                    .transition(.opacity)
            }
        }
        .foregroundColor(.white)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct PopularMoviesList: View {
    let movies: [Movie]
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            Text("Popular Searches")
                .font(.body)
                .bold()
                .padding(.leading, 8)
            ForEach(movies, id: \.id) { movie in
                
                PopularMovieView(movie: movie, movieDetailToShow: $movieDetailToShow)
                    .frame(height: 75)
            }
        }
        .padding(.vertical, 16)
    }
}
