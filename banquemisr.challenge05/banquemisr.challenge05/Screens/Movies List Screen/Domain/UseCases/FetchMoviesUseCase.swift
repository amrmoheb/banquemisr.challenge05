//
//  FetchMoviesUseCase.swift
//  banquemisr.challenge05
//
//  Created by Amr Moheb on 23/01/2025.
//

import Foundation
import Combine

class FetchMoviesUseCase: FetchMoviesUseCaseProtocol {
    private let repository: MoviesListRepositoryProtocol

    init(repository: MoviesListRepositoryProtocol = MoviesListRepository()) {
        self.repository = repository
    }

    func execute(category: MovieCategory) -> AnyPublisher<MovieResponse, Error> {
        repository.getMovies(forceRefresh: false, category: category)
    }
}
