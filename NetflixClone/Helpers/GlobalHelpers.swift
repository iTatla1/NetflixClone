//
//  GlobalHelpers.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/28/21.
//

import Foundation
import SwiftUI

let categories = ["Dystopium", "Exciting", "Suspensefull", "Sci-FI"]
let currentEpisodeInoExample1 = CurrentEpisodeInfo(episodeName: "Beginnings and Endings", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus rutrum aliquam tortor quis suscipit..", season: 1, episode: 1)
let exampleMovie1 = Movie(id: UUID().uuidString, name: "DARK", thumbnailURL: URL(string: "https://picsum.photos/200/300")!, categories: categories, year: 2020, rating: "TV-MA", quality: "HD", numberOfSeasons: 1, defaultEpisodeInfo: currentEpisodeInoExample1, creators: "Netflix, IFlix", cast: "Brad Pitt, Angalina Julie, Ben Afflick, Leonardo Di Caprio, Rock, Brad Smith", moreLikeThisMovie: [exampleMovie2,exampleMovie3,exampleMovie4,exampleMovie5,exampleMovie6, exampleMovie7].shuffled())

let exampleMovie2 = Movie(id: UUID().uuidString, name: "Travellers", thumbnailURL: URL(string: "https://picsum.photos/200/300/")!, categories: categories, year: 2020, rating: "TV-MA", quality: "3D", numberOfSeasons: 2, promotionHeadLine: "New Episodes Coming Soon", defaultEpisodeInfo: currentEpisodeInoExample1, creators: "Netflix, IFlix", cast: "Brad Pitt, Angalina Julie, Ben Afflick, Leonardo Di Caprio, Rock, Brad Smith", moreLikeThisMovie: [])

let exampleMovie3 = Movie(id: UUID().uuidString, name: "Community", thumbnailURL: URL(string: "https://picsum.photos/200/301")!, categories: categories, year: 2020, rating: "TV-MA", quality: "2D", numberOfSeasons: 3, defaultEpisodeInfo: currentEpisodeInoExample1, creators: "Netflix, IFlix", cast: "Brad Pitt, Angalina Julie, Ben Afflick, Leonardo Di Caprio, Rock, Brad Smith", moreLikeThisMovie: [])

let exampleMovie4 = Movie(id: UUID().uuidString, name: "Alone", thumbnailURL: URL(string: "https://picsum.photos/200/302")!, categories: categories, year: 2020, rating: "TV-MA", quality: "1K", numberOfSeasons: 1, defaultEpisodeInfo: currentEpisodeInoExample1, creators: "Netflix, IFlix", cast: "Brad Pitt, Angalina Julie, Ben Afflick, Leonardo Di Caprio, Rock, Brad Smith", moreLikeThisMovie: [])

let exampleMovie5 = Movie(id: UUID().uuidString, name: "AfterLife", thumbnailURL: URL(string: "https://picsum.photos/200/303")!, categories: categories, year: 2020, rating: "TV-MA", quality: "4K", numberOfSeasons:5, defaultEpisodeInfo: currentEpisodeInoExample1, creators: "Netflix, IFlix", cast: "Brad Pitt, Angalina Julie, Ben Afflick, Leonardo Di Caprio, Rock, Brad Smith", moreLikeThisMovie: [])

let exampleMovie6 = Movie(id: UUID().uuidString, name: "Naruto", thumbnailURL: URL(string: "https://picsum.photos/200/304")!, categories: categories, year: 2020, rating: "TV-MA", quality: "8K", numberOfSeasons:2, promotionHeadLine: "Watch Season 2 Now", defaultEpisodeInfo: currentEpisodeInoExample1, creators: "Netflix, IFlix", cast: "Brad Pitt, Angalina Julie, Ben Afflick, Leonardo Di Caprio, Rock, Brad Smith", moreLikeThisMovie: [])

let exampleMovie7 = exampleMovie6


var exampleMovies: [Movie] { [exampleMovie1,exampleMovie2,exampleMovie3,exampleMovie4,exampleMovie5,exampleMovie6].shuffled() }


extension LinearGradient {
    static let blackOpacityGradient =  LinearGradient(colors: [Color.clear, Color.black.opacity(0.95)], startPoint: .top, endPoint: .bottom)
}

extension String {
    func widthForString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
