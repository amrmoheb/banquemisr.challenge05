//
//  File.swift
//  banquemisr.challenge05
//
//  Created by Amr Moheb on 23/01/2025.
//

import Foundation
import SwiftUI

struct MoviesListView: View {
    @StateObject private var viewModel = MoviesListViewModel()

    var body: some View {
        TabView {
            MovieList(category: .nowPlaying, viewModel: viewModel)
                .tabItem {
                    Label("Now Playing", systemImage: "film")
                }

            MovieList(category: .popular, viewModel: viewModel)
                .tabItem {
                    Label("Popular", systemImage: "star.fill")
                }

            MovieList(category: .upcoming, viewModel: viewModel)
                .tabItem {
                    Label("Upcoming", systemImage: "calendar")
                }
        }
    }
}


