//
//  Errors.swift
//  CountryApi
//
//  Created by Srikanth Kyatham on 12/12/24.
//

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case dataNotFound
    case decodingFailed
    case fetchFailed
}
