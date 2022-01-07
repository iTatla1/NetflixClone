//
//  SearchVM.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 1/7/22.
//

import Foundation
import SwiftUI

class SearchVM: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var viewState: ViewState = .ready
    @Published var popularMovies: [Movie] = []
    @Published var searchMovie: [Movie] = []
    @Published var isShowingPopularMovie: Bool = true

    public func updatedSearchText(with text: String) {
        setViewState(to: .loading)
        
        if !text.isEmpty {
            isShowingPopularMovie = false
            getSearchResults(for: text)
        }
        else {
            isShowingPopularMovie = true
        }
    }
    
    init() {
        getPopularaMovie()
    }
    
    private func setViewState(to state: ViewState) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.viewState = state
            self.isLoading = state == .loading
        }
    }
    
    private func getPopularaMovie() {
        self.popularMovies = generateMovies(40)
    }
    
    private func getSearchResults(for text: String) {
        let haveResult = Int.random(in: 0...3)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if haveResult == 0{
                self.searchMovie = []
                self.setViewState(to: .empty)
            }
            else {
                self.searchMovie = generateMovies(21)
                self.setViewState(to: .ready)
            }
        }
    }

}

enum ViewState {
    case empty
    case loading
    case ready
    case error
}
