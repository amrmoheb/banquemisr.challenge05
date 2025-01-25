//
//  MovieDetailsServiceProtocol.swift
//  banquemisr.challenge05
//
//  Created by Amr Moheb on 25/01/2025.
//

import Foundation
import Combine

protocol MovieDetailsServiceProtocol {
    func fetchMovieDetails(movieId: Int) -> AnyPublisher<MovieDetails, Error>
}
