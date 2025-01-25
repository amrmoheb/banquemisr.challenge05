//
//  MovieDetailsRepository.swift
//  banquemisr.challenge05
//
//  Created by Amr Moheb on 25/01/2025.
//

import Foundation
import Combine

class MovieDetailsRepository: MovieDetailsRepositoryProtocol {
    private let service: MovieDetailsServiceProtocol

    init(service: MovieDetailsServiceProtocol = MovieDetailsService()) {
        self.service = service
    }

    func getMovieDetails(movieId: Int) -> AnyPublisher<MovieDetails, Error> {
        return service.fetchMovieDetails(movieId: movieId)
    }
}
