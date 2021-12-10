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
    let poster_path: String
    let release_date: String
    
    static let testMovie = Movie(id: 1, title: "Title", overview: "overview", backdrop_path: "/akwg1s7hV5ljeSYFfkw7hTHjVqk.jpg", poster_path: "/kv2Qk9MKFFQo4WQPaYta599HkJP.jpg", release_date: "2021-07-11")
}


