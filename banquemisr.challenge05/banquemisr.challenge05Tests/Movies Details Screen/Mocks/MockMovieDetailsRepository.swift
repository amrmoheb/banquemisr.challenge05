import Combine
import Foundation
@testable import banquemisr_challenge05

class MockMovieDetailsRepository: MovieDetailsRepositoryProtocol {
    var shouldFail = false

    func getMovieDetails(movieId: Int) -> AnyPublisher<MovieDetails, Error> {
        if shouldFail {
            return Fail(error: URLError(.badServerResponse))
                .eraseToAnyPublisher()
        } else {
            let mockDetails = MovieDetails(id: 1, title: "Mock Movie")
            return Just(mockDetails)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
}
