//
//  MovieServiceError.swift
//  Flix
//
//  Created by Gerdin Ventura on 12/10/21.
//

import Foundation

enum MovieError: Error {
    case INVALID_RESPONSE
    case INVALID_DATA
    case UNABLE_TO_DECODE
    case UNABLE_TO_CREATE_IMAGE
}
