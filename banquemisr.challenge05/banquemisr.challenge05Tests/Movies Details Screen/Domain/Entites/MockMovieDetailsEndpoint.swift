//
//  MockMovieDetailsEndpoint.swift
//  banquemisr.challenge05Tests
//
//  Created by Amr Moheb on 25/01/2025.
//

import Foundation
import Combine
@testable import banquemisr_challenge05

enum MockMovieDetailsSuccessEndpoint: EndpointProtocol {
    case allCountries

    var url: String? {
        switch self {
        case .allCountries:
            return "CountriesListSuccessResponse" // JSON file name for all countries
        }
    }

    var method: String {
        return ""
    }

    var headers: [String: String] {
        return [:]
    }
}

enum MockMovieDetailsFailureEndpoint: EndpointProtocol {
    case allCountries

    var url: String? {
        switch self {
        case .allCountries:
            return "CountriesListFailureResponse" // JSON file name for all countries
        }
    }

    var method: String {
        return ""
    }

    var headers: [String: String] {
        return [:]
    }
}
