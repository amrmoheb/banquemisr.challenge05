//
//  MovieDetailsUseCaseProtocol.swift
//  banquemisr.challenge05
//
//  Created by Amr Moheb on 25/01/2025.
//

import Foundation
import Combine

protocol MovieDetailsUseCaseProtocol {
    func execute(movieId: Int) -> AnyPublisher<MovieDetails, Error>
}
