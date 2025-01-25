//
//  MovieDetailsUseCase.swift
//  banquemisr.challenge05
//
//  Created by Amr Moheb on 25/01/2025.
//

import Foundation
import Combine

class MovieDetailsUseCase: MovieDetailsUseCaseProtocol {
    private let repository: MovieDetailsRepositoryProtocol

    init(repository: MovieDetailsRepositoryProtocol = MovieDetailsRepository()) {
        self.repository = repository
    }

    func execute(movieId: Int) -> AnyPublisher<MovieDetails, Error> {
        return repository.getMovieDetails(movieId: movieId)
    }
}
