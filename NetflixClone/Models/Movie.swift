//
//  Movie.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/28/21.
//

import Foundation
import SwiftUI

struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    
    var categories: [String]
    
    // Movie Details View
    
    var accentColor: Color? = .white
    
    var year: Int
    var rating: String
    var quality: String
    var numberOfSeasons: Int?
    var episode: [Episode]?
    
    var promotionHeadLine: String?
    
    var genere: HomeGenere = .AllGenere
    
    var movieType: MovieType {
        if episode != nil {
            return .movie
        }
        return .tvShow
    }
    
    // Personalization
    var currentEpisode: CurrentEpisodeInfo?
    var defaultEpisodeInfo: CurrentEpisodeInfo
    
    var creators: String
    var cast: String
    
    var moreLikeThisMovie: [Movie]
    
    var trailers: [Trailer]
    
    var previewImageName: String
    var previewVideoURL: URL?
    
    var numOfSeasonsDispaly: String {
        if let num = numberOfSeasons {
            if num == 1 {
                return "1 season"
            }
            else {
                return "\(num) seasons"
            }
        }
        return ""
    }
    
    var episodeInfoDisplay: String {
        if let currentEpisode = currentEpisode {
            return "S\(currentEpisode.season):E\(currentEpisode.episode) \(currentEpisode.episodeName)"
        } else {
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.episodeName)"
        }
    }
    
    var episodeDescriptionDisplay: String {
        if let currentEpisode = currentEpisode {
            return currentEpisode.description
        }
        return defaultEpisodeInfo.description
    }
}

struct CurrentEpisodeInfo {
    let episodeName: String
    let description: String
    let season: Int
    let episode: Int
}

enum MovieType {
    case movie
    case tvShow
}
