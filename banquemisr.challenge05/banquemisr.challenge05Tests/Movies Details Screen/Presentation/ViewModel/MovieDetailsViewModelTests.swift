import XCTest
import Combine
@testable import banquemisr_challenge05

class MovieDetailsViewModelTests: XCTestCase {
    var cancellables: Set<AnyCancellable> = []

    override func tearDown() {
        cancellables.removeAll()
        super.tearDown()
    }

    func testMovieDetailsViewModelSuccess() {
        let mockUseCase = MockMovieDetailsUseCase()
        let viewModel = MovieDetailsViewModel(useCase: mockUseCase)

        let expectation = XCTestExpectation(description: "ViewModel fetches movie details successfully")

        viewModel.fetchMovieDetails(movieId: 1)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(viewModel.movieDetails?.title, "Mock Movie")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func testMovieDetailsViewModelFailure() {
        let mockUseCase = MockMovieDetailsUseCase()
        mockUseCase.shouldFail = true
        let viewModel = MovieDetailsViewModel(useCase: mockUseCase)

        let expectation = XCTestExpectation(description: "ViewModel fails to fetch movie details")

        viewModel.fetchMovieDetails(movieId: 1)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertNil(viewModel.movieDetails)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
