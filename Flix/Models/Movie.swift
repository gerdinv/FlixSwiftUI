//
//  MovieModel.swift
//  Flix
//
//  Created by Gerdin Ventura on 12/10/21.
//

import Foundation


struct MovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let backdrop_path: String
    
    static let testMovie = Movie(id: 1, title: "Title", overview: "overview", backdrop_path: "/ng6SSB3JhbcpKTwbPDsRwUYK8Cq.jpg")
}


