//
//  NetworkManager.swift
//  Flix
//
//  Created by Gerdin Ventura on 12/10/21.
//

import Foundation
import UIKit
import SwiftUI

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
    private let baseUrlForImage = "https://image.tmdb.org/t/p/w500"
    private init() {}
    
    func getMovies(completion: @escaping(Result<[Movie], MovieError>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: URL(string: baseURL)!)) { data, res, err in
            
            guard let data = data, err == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let ans = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(ans.results))
                return
            } catch {
                completion(.failure(.unableToDecode))
                return
            }
            
        }
        
        task.resume()
    }
    
    func getPoserImage(imagePath: String, completion: @escaping(Result<UIImage, MovieError>) -> Void) {
        let url = baseUrlForImage + imagePath
        let req = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: req) { data, res, err in
            
            guard err == nil else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            // Create the image
            guard let loadedImage = UIImage(data: data) else {
                completion(.failure(.unableToCreateImage))
                return
            }
            
            completion(.success(loadedImage))
            
            
        }
        
        task.resume()
    }
}
