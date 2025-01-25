//
//  MovieList.swift
//  banquemisr.challenge05
//
//  Created by Amr Moheb on 23/01/2025.
//

import Foundation
import SwiftUI

struct MovieList: View {
    let category: MovieCategory
    @ObservedObject var viewModel: MoviesListViewModel

    var movies: [Movie] {
        switch category {
        case .nowPlaying:
            return viewModel.nowPlayingMovies
        case .popular:
            return viewModel.popularMovies
        case .upcoming:
            return viewModel.upcomingMovies
        }
    }

    var body: some View {
        NavigationView {
            List(movies) { movie in
                NavigationLink(destination: MovieDetailsView(movieId: movie.id, movieTitle: movie.title)) {
                    MovieRow(movie: movie)
                }
            }
            .navigationTitle(category.rawValue)
            .onAppear {
                switch category {
                case .nowPlaying:
                    viewModel.fetchMovies(category: .nowPlaying)
                case .popular:
                    viewModel.fetchMovies(category: .popular)
                case .upcoming:
                    viewModel.fetchMovies(category: .upcoming)
                }
            }
        }
    }
}
