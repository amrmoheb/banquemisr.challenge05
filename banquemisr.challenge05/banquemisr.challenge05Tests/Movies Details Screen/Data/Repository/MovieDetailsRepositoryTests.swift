import XCTest
import Combine
@testable import banquemisr_challenge05

class MovieDetailsRepositoryTests: XCTestCase {
    var cancellables: Set<AnyCancellable> = []

    override func tearDown() {
        cancellables.removeAll()
        super.tearDown()
    }

    func testMovieDetailsRepositorySuccess() {
        let mockService = MockMovieDetailsService()
        mockService.mockDetails = MovieDetails(id: 1, title: "Mock Movie")
        let repository = MovieDetailsRepository(service: mockService)

        let expectation = XCTestExpectation(description: "Repository fetches movie details successfully")

        repository.getMovieDetails(movieId: 1)
            .sink(receiveCompletion: { completion in
                if case .failure = completion {
                    XCTFail("Repository should succeed")
                }
            }, receiveValue: { details in
                XCTAssertEqual(details.title, "Mock Movie")
                expectation.fulfill()
            })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
}
