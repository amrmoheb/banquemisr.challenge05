//
//  MockMovieDetailsService.swift
//  banquemisr.challenge05Tests
//
//  Created by Amr Moheb on 25/01/2025.
//

import Foundation
import Combine
@testable import banquemisr_challenge05

class MockMovieDetailsService: MovieDetailsServiceProtocol {
    var shouldFail = false
    var mockDetails: MovieDetails?

    init(mockDetails: MovieDetails? = nil, shouldFail: Bool = false) {
        self.mockDetails = mockDetails
        self.shouldFail = shouldFail
    }

    func fetchMovieDetails(movieId: Int) -> AnyPublisher<MovieDetails, Error> {
        if shouldFail {
            return Fail(error: URLError(.badServerResponse))
                .eraseToAnyPublisher()
        } else if let details = mockDetails {
            return Just(details)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } else {
            return Fail(error: URLError(.cannotParseResponse))
                .eraseToAnyPublisher()
        }
    }
}
