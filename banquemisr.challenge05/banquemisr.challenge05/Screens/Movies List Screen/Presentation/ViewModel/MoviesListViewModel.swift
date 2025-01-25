//
//  MoviesListViewModel.swift
//  banquemisr.challenge05
//
//  Created by Amr Moheb on 23/01/2025.
//

import Foundation
import Combine

class MoviesListViewModel: ObservableObject {
    @Published var nowPlayingMovies: [Movie] = []
    @Published var popularMovies: [Movie] = []
    @Published var upcomingMovies: [Movie] = []
    @Published var errorMessage: String?

    private let fetchMoviesUseCase: FetchMoviesUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(fetchMoviesUseCase: FetchMoviesUseCaseProtocol = FetchMoviesUseCase()) {
            self.fetchMoviesUseCase = fetchMoviesUseCase
        }

    func fetchMovies(category: MovieCategory) {
        fetchMoviesUseCase.execute(category: category)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Failed to fetch \(category.rawValue): \(error.localizedDescription)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] response in
                DispatchQueue.main.async {
                    switch category {
                    case .nowPlaying:
                        self?.nowPlayingMovies = response.results
                    case .popular:
                        self?.popularMovies = response.results
                    case .upcoming:
                        self?.upcomingMovies = response.results
                    }
                }
            })
            .store(in: &cancellables)
    }
    

}
