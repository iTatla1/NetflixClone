//
//  GlobalHelpers.swift
//  NetflixClone
//
//  Created by Muhammad Usman Tatla on 12/28/21.
//

import Foundation
import SwiftUI

let categories = ["Dystopium", "Exciting", "Suspensefull", "Sci-FI"]
let exampleMovie1 = Movie(id: UUID().uuidString, name: "DARK", thumbnailURL: URL(string: "https://picsum.photos/200/300")!, categories: categories)
let exampleMovie2 = Movie(id: UUID().uuidString, name: "Travellers", thumbnailURL: URL(string: "https://picsum.photos/200/300/")!, categories: categories)
let exampleMovie3 = Movie(id: UUID().uuidString, name: "Community", thumbnailURL: URL(string: "https://picsum.photos/200/301")!, categories: categories)
let exampleMovie4 = Movie(id: UUID().uuidString, name: "Alone", thumbnailURL: URL(string: "https://picsum.photos/200/302")!, categories: categories)
let exampleMovie5 = Movie(id: UUID().uuidString, name: "AfterLife", thumbnailURL: URL(string: "https://picsum.photos/200/303")!, categories: categories)
let exampleMovie6 = Movie(id: UUID().uuidString, name: "Naruto", thumbnailURL: URL(string: "https://picsum.photos/200/304")!, categories: categories)


let exampleMovies: [Movie] = [exampleMovie1,exampleMovie2,exampleMovie3,exampleMovie4,exampleMovie5,exampleMovie6]


extension LinearGradient {
    static let blackOpacityGradient =  LinearGradient(colors: [Color.clear, Color.black.opacity(0.95)], startPoint: .top, endPoint: .bottom)
}
