//
//  Country.swift
//  CountryApi
//
//  Created by Srikanth Kyatham on 12/12/24.
//

import Foundation

struct Country: Decodable {
    let capital: String?
    let code: String?
    let currency: Currency?
    let flag: String?
    let language: Language?
    let name: String
    let region: String?
    

}

// MARK: - Currency
struct Currency: Decodable {
    let code: String?
    let name: String?
    let symbol: String?
}

// MARK: - Language
struct Language: Decodable {
    let code: String?
    let name: String
}

