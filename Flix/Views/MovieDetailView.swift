//
//  MovieDetailView.swift
//  Flix
//
//  Created by Gerdin Ventura on 12/10/21.
//

import SwiftUI

struct MovieDetailView: View {
    
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                PosterImage(movie: movie)
            }
            Spacer().frame(height: 70)
            HStack {
                Text(movie.title).font(.system(size: 43, weight: .bold, design: .default))
                Spacer()
                Text(movie.release_date).padding(.trailing, 15)
            }
            
            Spacer().frame(height: 10)
            Text(movie.overview).padding(.leading, 30)
            
            Spacer()
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie.testMovie)
    }
}
