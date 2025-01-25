//
//  File.swift
//  banquemisr.challenge05
//
//  Created by Amr Moheb on 23/01/2025.
//

import Foundation

enum MovieDetailsEndpoint: EndpointProtocol {
    case details(movieId: Int)

    var url: String? {
        switch self {
        case .details(let movieId):
            return "/3/movie/\(movieId)?language=en-US"
        }
    }

    var method: String {
        switch self {
        case .details:
            return "GET"
        }
    }

    var headers: [String: String] {
        switch self {
        case .details:
            return [
                "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiY2QwYTQzN2E5OTdlYjM4ZDM0YzFlMDg4YzllYzRlZiIsIm5iZiI6MTcwOTg1NjQ3OS4zOTMsInN1YiI6IjY1ZWE1NmRmYTI0MjMyMDE2MTMyYWM0ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UkCPzmsDYtdIiY4EigUDJnJxtpFkBuJb3gReY8LtCts",
                "accept": "application/json"
            ]
        }
    }
}
