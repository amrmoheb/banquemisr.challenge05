import Combine
import Foundation
@testable import banquemisr_challenge05

class MockMovieDetailsUseCase: MovieDetailsUseCaseProtocol {
    var shouldFail = false

    func execute(movieId: Int) -> AnyPublisher<MovieDetails, Error> {
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
