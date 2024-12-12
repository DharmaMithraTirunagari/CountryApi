//
//  NetworkManager.swift
//  CountryApi
//
//  Created by Srikanth Kyatham on 12/12/24.
//

import Foundation


protocol NetworkProtocol {
    func fetchCountries<T: Decodable>(from urlString: String, responseType: T.Type) async throws -> T
}

class NetworkManager: NetworkProtocol {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchCountries<T: Decodable>(from urlString: String, responseType: T.Type) async throws -> T {
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let decodedData = try? JSONDecoder().decode(responseType.self, from: data) else {
            throw NetworkError.decodingFailed
        }
        return decodedData
    }
}
