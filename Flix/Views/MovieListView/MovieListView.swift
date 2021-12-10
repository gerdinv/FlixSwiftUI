//
//  MainView.swift
//  Flix
//
//  Created by Gerdin Ventura on 12/10/21.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject private var viewModel = MovieListViewModel()

    var body: some View {
        
        NavigationView {
            List {
                ForEach(viewModel.movies) { movie in
                    NavigationLink {
                        MovieDetailView(movie: movie)
                    } label: {
                        MovieCell(movie: movie)
                    }
                    
                }
            }
            .navigationTitle("Movies")
            .listStyle(PlainListStyle()) // <- add here
            .onAppear {
                UITableView.appearance().separatorColor = .clear
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
