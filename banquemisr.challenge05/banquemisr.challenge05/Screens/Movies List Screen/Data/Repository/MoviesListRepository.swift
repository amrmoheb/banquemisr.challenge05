//
//  File.swift
//  CMECodeChallenge
//
//  Created by Amr Moheb on 16/01/2025.
//

import Foundation
import Combine

final class MoviesListRepository: MoviesListRepositoryProtocol {
    private let localDataSource: LocalDataSourceProtocol
    private let remoteDataSource: RemoteDataSourceProtocol

    init(localDataSource: LocalDataSourceProtocol = LocalDataSource(), remoteDataSource: RemoteDataSourceProtocol = RemoteDataSource()) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }

    func getMovies(forceRefresh: Bool = false, category: MovieCategory) -> AnyPublisher<MovieResponse, Error> {
        if forceRefresh {
            return fetchAndCacheMovies(category: category)
        } else if let cachedMovies: MovieResponse = localDataSource.fetchData(forKey: getCachKey(category: category)) {
            return Just(cachedMovies)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } else {
            return fetchAndCacheMovies(category: category)
        }
    }

    private func fetchAndCacheMovies(category: MovieCategory) -> AnyPublisher<MovieResponse, Error> {
        remoteDataSource.fetchRemoteData(endpoint: createEndPoint(category: category), responseType: MovieResponse.self)
            .handleEvents(receiveOutput: { [weak self] movies in
                try? self?.localDataSource.saveData(movies, forKey: self?.getCachKey(category: category) ?? "")
            })
            .eraseToAnyPublisher()
    }
    
    private func createEndPoint(category: MovieCategory) -> MovieCategoryEndpoint {
        let endpoint: MovieCategoryEndpoint
        switch category {
        case .nowPlaying:
            endpoint = .nowPlaying
        case .popular:
            endpoint = .popular
        case .upcoming:
            endpoint = .upcoming
        }
        return endpoint
    }
    private func getCachKey(category: MovieCategory) -> String {
        let cachKey: String
        switch category {
        case .nowPlaying:
            cachKey = "NowPlayingMovies"
        case .popular:
            cachKey = "PopularMovies"
        case .upcoming:
            cachKey = "upcomingMovies"
        }
        return cachKey
    }
}
