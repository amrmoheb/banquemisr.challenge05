import XCTest
import Combine
@testable import banquemisr_challenge05

class MovieDetailsServiceTests: XCTestCase {
    var cancellables: Set<AnyCancellable> = []

    override func tearDown() {
        cancellables.removeAll()
        super.tearDown()
    }

    func testMovieDetailsServiceSuccess() {
        let mockNetworkManager = MockNetworkManager()
        let service = MovieDetailsService(networkManager: mockNetworkManager)

        let expectation = XCTestExpectation(description: "Service fetches movie details successfully")

        service.fetchMovieDetails(movieId: 1)
            .sink(receiveCompletion: { completion in
                if case .failure = completion {
                    XCTFail("Service should succeed")
                }
            }, receiveValue: { details in
                XCTAssertEqual(details.title, "Mock Movie")
                expectation.fulfill()
            })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
}
