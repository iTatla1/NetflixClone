//
//  GlobalHelpers.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/28/21.
//

import Foundation
import SwiftUI

let exampleVideoURL = URL(string: "https://assets.mixkit.co/videos/preview/mixkit-going-down-a-curved-highway-down-a-mountain-41576-large.mp4")!
let exampleImageURL = URL(string: "https://picsum.photos/300/400/")!
let exampleImageURL1 = URL(string: "https://picsum.photos/300/401/")!
let exampleImageURL2 = URL(string: "https://picsum.photos/300/402/")!

var randomExampleImageURL: URL {
    [exampleImageURL,exampleImageURL1,exampleImageURL2].randomElement() ?? exampleImageURL
}

let exampleTrailer1 = Trailer(name: "Season1 Trailer", videoURL: exampleVideoURL, thumbnailImageURL: exampleImageURL)
let exampleTrailer2 = Trailer(name: "Season2 Trailer", videoURL: exampleVideoURL, thumbnailImageURL: exampleImageURL1)
let exampleTrailer3 = Trailer(name: "Season3 Trailer", videoURL: exampleVideoURL, thumbnailImageURL: exampleImageURL2)

let exampleTrailers: [Trailer] = [] //[exampleTrailer1,exampleTrailer2,exampleTrailer3]




let categories = ["Dystopium", "Exciting", "Suspensefull", "Sci-FI"]

let currentEpisodeInoExample1 = CurrentEpisodeInfo(episodeName: "Beginnings and Endings", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus rutrum aliquam tortor quis suscipit..", season: 1, episode: 1)

let episode1 = Episode(episodeNumber: 1, name: "Beginning & Ending", season: 1, thumbnailImageURLString: randomExampleImageURL.absoluteString, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus rutrum aliquam tortor quis suscipit..", length: 12, videoURL: exampleVideoURL)
let episode2 = Episode(episodeNumber: 2, name: "Dark Matter", season: 1, thumbnailImageURLString: randomExampleImageURL.absoluteString, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus rutrum aliquam tortor quis suscipit..", length: 12, videoURL: exampleVideoURL)
let episode3 = Episode(episodeNumber: 3, name: "Ghosts", season: 1, thumbnailImageURLString: randomExampleImageURL.absoluteString, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus rutrum aliquam tortor quis suscipit..", length: 12, videoURL: exampleVideoURL)

let episode4 = Episode(episodeNumber: 1, name: "Beginning & Ending", season: 2, thumbnailImageURLString: randomExampleImageURL.absoluteString, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus rutrum aliquam tortor quis suscipit..", length: 12, videoURL: exampleVideoURL)
let episode5 = Episode(episodeNumber: 2, name: "Dark Matter", season: 2, thumbnailImageURLString: randomExampleImageURL.absoluteString, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus rutrum aliquam tortor quis suscipit..", length: 12, videoURL: exampleVideoURL)
let episode6 = Episode(episodeNumber: 1, name: "Ghosts", season: 3, thumbnailImageURLString: randomExampleImageURL.absoluteString, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus rutrum aliquam tortor quis suscipit..", length: 12, videoURL: exampleVideoURL)

let exampleEpisodes = [episode1,episode2,episode3,episode4,episode5,episode6].shuffled()


let exampleMovie1 = Movie(id: UUID().uuidString, name: "DARK", thumbnailURL: URL(string: "https://picsum.photos/200/300")!, categories: categories, accentColor: .orange, year: 2020, rating: "TV-MA", quality: "HD", numberOfSeasons: 2, episode: exampleEpisodes, defaultEpisodeInfo: currentEpisodeInoExample1, creators: "Netflix, IFlix", cast: "Brad Pitt, Angalina Julie, Ben Afflick, Leonardo Di Caprio, Rock, Brad Smith", moreLikeThisMovie: [exampleMovie2,exampleMovie3,exampleMovie4], trailers: [exampleTrailer1], previewImageName: "arrestedDevPreview", previewVideoURL: exampleVideoURL)

let exampleMovie2 = Movie(id: UUID().uuidString, name: "Travellers", thumbnailURL: URL(string: "https://picsum.photos/200/300/")!, categories: categories, year: 2020, rating: "TV-MA", quality: "3D", numberOfSeasons: 2, promotionHeadLine: "New Episodes Coming Soon", defaultEpisodeInfo: currentEpisodeInoExample1, creators: "Netflix, IFlix", cast: "Brad Pitt, Angalina Julie, Ben Afflick, Leonardo Di Caprio, Rock, Brad Smith", moreLikeThisMovie: [], trailers: exampleTrailers, previewImageName: "darkPreview", previewVideoURL: exampleVideoURL)

let exampleMovie3 = Movie(id: UUID().uuidString, name: "Community", thumbnailURL: URL(string: "https://picsum.photos/200/301")!, categories: categories, year: 2020, rating: "TV-MA", quality: "2D", numberOfSeasons: 3, defaultEpisodeInfo: currentEpisodeInoExample1, creators: "Netflix, IFlix", cast: "Brad Pitt, Angalina Julie, Ben Afflick, Leonardo Di Caprio, Rock, Brad Smith", moreLikeThisMovie: [], trailers: exampleTrailers, previewImageName: "dirtyJohnPreview", previewVideoURL: exampleVideoURL)

let exampleMovie4 = Movie(id: UUID().uuidString, name: "Alone", thumbnailURL: URL(string: "https://picsum.photos/200/302")!, categories: categories, year: 2020, rating: "TV-MA", quality: "1K", numberOfSeasons: 1, defaultEpisodeInfo: currentEpisodeInoExample1, creators: "Netflix, IFlix", cast: "Brad Pitt, Angalina Julie, Ben Afflick, Leonardo Di Caprio, Rock, Brad Smith", moreLikeThisMovie: [], trailers: exampleTrailers, previewImageName: "ozarkPreview", previewVideoURL: exampleVideoURL)

let exampleMovie5 = Movie(id: UUID().uuidString, name: "AfterLife", thumbnailURL: URL(string: "https://picsum.photos/200/303")!, categories: categories, year: 2020, rating: "TV-MA", quality: "4K", numberOfSeasons:5, defaultEpisodeInfo: currentEpisodeInoExample1, creators: "Netflix, IFlix", cast: "Brad Pitt, Angalina Julie, Ben Afflick, Leonardo Di Caprio, Rock, Brad Smith", moreLikeThisMovie: [], trailers: exampleTrailers, previewImageName: "whiteLinesPreview", previewVideoURL: exampleVideoURL)

let exampleMovie6 = Movie(id: UUID().uuidString, name: "Naruto", thumbnailURL: URL(string: "https://picsum.photos/200/304")!, categories: categories, year: 2020, rating: "TV-MA", quality: "8K", numberOfSeasons:2, promotionHeadLine: "Watch Season 2 Now", defaultEpisodeInfo: currentEpisodeInoExample1, creators: "Netflix, IFlix", cast: "Brad Pitt, Angalina Julie, Ben Afflick, Leonardo Di Caprio, Rock, Brad Smith", moreLikeThisMovie: [], trailers: exampleTrailers, previewImageName: "travelersPreview", previewVideoURL: exampleVideoURL)

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

extension View {
    func hideKeyBoard () {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
