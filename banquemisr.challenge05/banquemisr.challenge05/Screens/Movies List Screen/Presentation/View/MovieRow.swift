//
//  File.swift
//  banquemisr.challenge05
//
//  Created by Amr Moheb on 23/01/2025.
//

import Foundation
import SwiftUI

struct MovieRow: View {
    let movie: Movie

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(movie.posterPath ?? "")")) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 150)
            .cornerRadius(8)

            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.headline)
                    .lineLimit(2)
                Text(movie.releaseDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(movie.overview)
                    .font(.caption)
                    .lineLimit(3)
                    .foregroundColor(.secondary)
            }
            .padding(.leading, 8)
        }
        .padding(.vertical, 8)
    }
}


