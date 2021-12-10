//
//  PosterImageModel.swift
//  Flix
//
//  Created by Gerdin Ventura on 12/10/21.
//

import Foundation
import SwiftUI

class PosterImageModel: ObservableObject {
    
    @Published var image: UIImage?
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        loadImage()
    }
    
    func getImage() -> Bool{
        guard let cachedImage = ImageCache.imageCache.get(forKey: movie.poster_path) else {
            return false
        }
        image = cachedImage
        return true
    }
    
    func loadImage() {
        NetworkManager.shared.getPosterImage(posterURL: movie.poster_path) { [self] result in
            switch result {
            case .success(let posterImage):
                ImageCache.imageCache.set(forKey: movie.poster_path, image: posterImage)
                DispatchQueue.main.async {
                    self.image = posterImage
                }
            case .failure(_):
                break
            }
        }
    }
}
