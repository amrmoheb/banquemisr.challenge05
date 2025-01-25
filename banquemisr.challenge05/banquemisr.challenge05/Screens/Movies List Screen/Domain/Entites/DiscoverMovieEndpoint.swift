//
//  DiscoverMovieEndpoint.swift
//  banquemisr.challenge05
//
//  Created by Amr Moheb on 23/01/2025.
//

import Foundation
/*
enum DiscoverMovieEndpoint: EndpointProtocol {
    case discoverMovies(minDate: String, maxDate: String)

    var url: String? {
        switch self {
        case .discoverMovies(let minDate, let maxDate):
            return "/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_release_type=2|3&release_date.gte=\(minDate)&release_date.lte=\(maxDate)"
        }
    }

    var method: String {
        switch self {
        case .discoverMovies:
            return "GET"
        }
    }

    var headers: [String: String] {
        switch self {
        case .discoverMovies:
            return [
                "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiY2QwYTQzN2E5OTdlYjM4ZDM0YzFlMDg4YzllYzRlZiIsIm5iZiI6MTcwOTg1NjQ3OS4zOTMsInN1YiI6IjY1ZWE1NmRmYTI0MjMyMDE2MTMyYWM0ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UkCPzmsDYtdIiY4EigUDJnJxtpFkBuJb3gReY8LtCts",
                "accept": "application/json"
            ]
        }
    }
}
*/
enum MovieCategoryEndpoint: EndpointProtocol {
    case nowPlaying
    case popular
    case upcoming

    var url: String? {
        switch self {
        case .nowPlaying:
            return "/3/movie/now_playing?language=en-US&page=1"
        case .popular:
            return "/3/movie/popular?language=en-US&page=1"
        case .upcoming:
            return "/3/movie/upcoming?language=en-US&page=1"
        }
    }

    var method: String {
        return "GET"
    }

    var headers: [String: String] {
        return [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiY2QwYTQzN2E5OTdlYjM4ZDM0YzFlMDg4YzllYzRlZiIsIm5iZiI6MTcwOTg1NjQ3OS4zOTMsInN1YiI6IjY1ZWE1NmRmYTI0MjMyMDE2MTMyYWM0ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UkCPzmsDYtdIiY4EigUDJnJxtpFkBuJb3gReY8LtCts",
            "accept": "application/json"
        ]
    }
}
