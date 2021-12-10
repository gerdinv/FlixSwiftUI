//
//  ContentView.swift
//  Flix
//
//  Created by Gerdin Ventura on 12/7/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = MovieListViewModel()
         
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.movies) { movie in
                    MovieCell(movie: movie)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
