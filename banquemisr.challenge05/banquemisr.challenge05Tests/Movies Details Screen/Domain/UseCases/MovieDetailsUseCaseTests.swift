import XCTest
import Combine
@testable import banquemisr_challenge05

class MovieDetailsUseCaseTests: XCTestCase {
    var cancellables: Set<AnyCancellable> = []

    override func tearDown() {
        cancellables.removeAll()
        super.tearDown()
    }

    func testMovieDetailsUseCaseSuccess() {
        let mockRepository = MockMovieDetailsRepository()
        let useCase = MovieDetailsUseCase(repository: mockRepository)

        let expectation = XCTestExpectation(description: "UseCase fetches movie details successfully")

        useCase.execute(movieId: 1)
            .sink(receiveCompletion: { completion in
                if case .failure = completion {
                    XCTFail("UseCase should succeed")
                }
            }, receiveValue: { details in
                XCTAssertEqual(details.title, "Mock Movie")
                expectation.fulfill()
            })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
}
