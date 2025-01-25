//
//  MovieDetailsService.swift
//  banquemisr.challenge05
//
//  Created by Amr Moheb on 25/01/2025.
//

import Foundation
import Combine

class MovieDetailsService: MovieDetailsServiceProtocol {
    private let networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }

    func fetchMovieDetails(movieId: Int) -> AnyPublisher<MovieDetails, Error> {
        let endpoint = MovieDetailsEndpoint.details(movieId: movieId)
        return networkManager.request(endpoint: endpoint, responseType: MovieDetails.self)
    }
}
