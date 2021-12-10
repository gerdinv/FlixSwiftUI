//
//  MovieServiceError.swift
//  Flix
//
//  Created by Gerdin Ventura on 12/10/21.
//

import Foundation

enum MovieError: Error {
    case invalidResponse
    case invalidData
    case unableToDecode
    case unableToCreateImage
}
