//
//  MovieCell.swift
//  Flix
//
//  Created by Gerdin Ventura on 12/8/21.
//

import SwiftUI

struct MovieCell: View {
    
    var movie: Movie
    
    var body: some View {
        HStack {
            MovieImage(movie: movie)
            VStack (alignment: .leading) {
                Text(movie.title)
                    .font(.system(size: 23,
                                  weight: .bold,
                                  design: .default))
                    .lineLimit(2)
                Text(movie.overview)
                    .font(.system(size: 21,
                                  weight: .regular,
                                  design: .default))
            } .frame(height: 190)
        }
    }
    
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: Movie.testMovie)
    }
        
}
