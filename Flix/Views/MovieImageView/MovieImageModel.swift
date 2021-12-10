//
//  MovieImageModel.swift
//  Flix
//
//  Created by Gerdin Ventura on 12/10/21.
//

import Foundation
import SwiftUI

class MovieImageModel: ObservableObject {
    @Published var image: UIImage?
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        getImage()
    }
    
    func getImage() {
        if loadImageFromCache() {
            return
        }
        loadImage()
    }
    
    func loadImageFromCache() -> Bool {
        guard let cachedImage = ImageCache.imageCache.get(forKey: movie.backdrop_path) else {
            return false
        }
        image = cachedImage
        return true
    }
    
    func loadImage() {
        NetworkManager.shared.getPoserImage(imagePath: movie.backdrop_path) { [self] result in
            switch result {
            case .success(let poster):
                ImageCache.imageCache.set(forKey: movie.backdrop_path, image: poster )
                DispatchQueue.main.async {
                    self.image = poster
                }
            case .failure(_): break
            }
        }
    }
    
}
