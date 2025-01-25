//
//  FetchMoviesUseCaseProtocol.swift
//  banquemisr.challenge05
//
//  Created by Amr Moheb on 23/01/2025.
//

import Foundation
import Combine

protocol FetchMoviesUseCaseProtocol {
    func execute(category: MovieCategory) -> AnyPublisher<MovieResponse, Error>
}
