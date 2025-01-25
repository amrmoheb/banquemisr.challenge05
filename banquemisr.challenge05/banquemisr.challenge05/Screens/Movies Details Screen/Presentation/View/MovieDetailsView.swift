//
//  File.swift
//  banquemisr.challenge05
//
//  Created by Amr Moheb on 23/01/2025.
//

import Foundation
import SwiftUI

struct MovieDetailsView: View {
    @StateObject private var viewModel = MovieDetailsViewModel()
    let movieId: Int
    let movieTitle: String

    var body: some View {
        ScrollView {
            if let details = viewModel.movieDetails {
                VStack(alignment: .leading, spacing: 16) {
                    Text(details.title ?? "")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)
                    Text(details.overview ?? "")
                        .font(.body)
                        .padding(.bottom)

                    if let runtime = details.runtime {
                        Text("Runtime: \(runtime) minutes")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    if !(details.isGenresEmpty) {
                        if let genres = details.genres {
                            Text("Genres: \(genres.map { $0.name }.joined(separator: ", "))")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding()
            } else {
                ProgressView()
            }
        }
        .onAppear {
            viewModel.fetchMovieDetails(movieId: movieId)
        }
        .alert(isPresented: $viewModel.showAlert) {
                    Alert(
                        title: Text(viewModel.alertData?.title ?? ""),
                        message: Text(viewModel.alertData?.message ?? ""),
                        dismissButton: .default(Text(viewModel.alertData?.buttonTitle ?? "OK"))
                    )
                }
        .navigationTitle(movieTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}
