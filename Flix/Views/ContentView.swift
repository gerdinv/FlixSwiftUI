//
//  ContentView.swift
//  Flix
//
//  Created by Gerdin Ventura on 12/7/21.
//

import SwiftUI

struct ContentView: View {
            
    var body: some View {
        TabView {
            MovieListView().tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            Text("Settings").tabItem {
                Image(systemName: "folder.circle.fill").renderingMode(.original)
                Text("Folder")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
