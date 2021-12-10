//
//  MovieListViewModel.swift
//  Flix
//
//  Created by Gerdin Ventura on 12/10/21.
//

import Foundation
import SwiftUI


// This means object is able to be observed.
// final for obtimization, object can't be subclassed..

final class MovieListViewModel: ObservableObject {
    
    //  B/c we're on an observable object, any time a published variable changes,
    //  (via network call or whatever...) it notifies the view that is listening for these changes
    //   and update the UI
    
    @Published var movies : [Movie] = []
    
    init() {
        loadMovies()
    }
    
    func loadMovies() {
        NetworkManager.shared.getMovies { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movies):
                    self.movies = movies
                case .failure(let err):
                    switch err {
                    case .invalidResponse:
                        print("Invalid response!")
                        
                    case .invalidData:
                        print("Invalid data!")
                        
                    case .unableToDecode:
                        print("Unable to decode!")
                        
                    case .unableToCreateImage:
                        print("Unable to convert Image!")
                    }
                }
            }
        }
        
    }
}
