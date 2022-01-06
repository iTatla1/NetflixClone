//
//  HomeVM.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/28/21.
//

import Foundation

class HomeVM: ObservableObject {
    
    // String is Category
    @Published var movies: [String: [Movie]] = [:]
    
    public var allCategories: [String] {
        movies.keys.map{$0 as String}.sorted()
    }
    
    public var allGenre: [HomeGenere] = HomeGenere.allCases
    
    public func getMovies(_ cat: String, andHomeRow homeRow: HomeTopRow, andGenere genere: HomeGenere) -> [Movie] {
        switch homeRow {
        case .home, .myList:
            return movies[cat] ?? []
        case .tvShows:
            return (movies[cat] ?? []).filter{$0.movieType == .tvShow && $0.genere == genere}
        case .movies:
            return (movies[cat] ?? []).filter{$0.movieType == .movie && $0.genere == genere}
        }
    }
    
    init(){
        setupMovies()
    }
    
    private func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-UP Comedy"] = exampleMovies.shuffled()
        movies["New Release"] = exampleMovies.shuffled()
        movies["Top Picks"] = exampleMovies.shuffled()
        movies["Action Thriller"] = exampleMovies.shuffled()
        movies["Family Movies"] = exampleMovies.shuffled()

        
    }
}
