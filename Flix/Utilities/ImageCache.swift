//
//  ImageCache.swift
//  Flix
//
//  Created by Gerdin Ventura on 12/10/21.
//

import Foundation
import SwiftUI


class ImageCache {
    static let imageCache = ImageCache()
    
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        return cache.setObject(image, forKey: NSString(string: forKey))
    }
}
 
