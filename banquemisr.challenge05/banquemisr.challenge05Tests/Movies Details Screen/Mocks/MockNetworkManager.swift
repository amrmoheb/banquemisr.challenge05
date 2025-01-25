import Combine
import Foundation
@testable import banquemisr_challenge05

class MockNetworkManager: NetworkManagerProtocol {
    var shouldFail = false

    func request<T: Decodable>(endpoint: EndpointProtocol, responseType: T.Type) -> AnyPublisher<T, Error> {
        if shouldFail {
            return Fail(error: URLError(.badServerResponse))
                .eraseToAnyPublisher()
        } else {
            let mockDetails = MovieDetails(id: 1, title: "Mock Movie") // Adjust with your model
            return Just(mockDetails as! T)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
}
