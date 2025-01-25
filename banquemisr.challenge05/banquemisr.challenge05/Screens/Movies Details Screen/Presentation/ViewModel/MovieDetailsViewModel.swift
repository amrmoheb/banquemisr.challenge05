//
//  MovieDetailsViewModel.swift
//  banquemisr.challenge05
//
//  Created by Amr Moheb on 23/01/2025.
//
import Combine
import Foundation

class MovieDetailsViewModel: ObservableObject {
    @Published var movieDetails: MovieDetails?
    @Published var showAlert: Bool = false
    @Published var alertData: AlertData?
    private var cancellables = Set<AnyCancellable>()
    private let useCase: MovieDetailsUseCaseProtocol

    init(useCase: MovieDetailsUseCaseProtocol = MovieDetailsUseCase()) {
        self.useCase = useCase
    }

    func fetchMovieDetails(movieId: Int) {
        useCase.execute(movieId: movieId)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.triggerAlert(msg: "Failed to fetch movie details: \(error.localizedDescription)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] details in
                self?.movieDetails = details
            })
            .store(in: &cancellables)
    }
    
    func triggerAlert(msg: String) {
        alertData = AlertData(
            title: "Error",
            message: msg,
            buttonTitle: "OK"
        )
        showAlert = true
    }
}
