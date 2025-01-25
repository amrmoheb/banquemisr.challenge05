//
//  MoviesListRepositoryProtocol.swift
//  banquemisr.challenge05
//
//  Created by Amr Moheb on 23/01/2025.
//

import Foundation
import Combine

protocol MoviesListRepositoryProtocol {
    func getMovies(forceRefresh: Bool, category: MovieCategory) -> AnyPublisher<MovieResponse, Error>
}
