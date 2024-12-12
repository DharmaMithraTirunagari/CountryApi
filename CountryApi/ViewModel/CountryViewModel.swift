//
//  CountryViewModel.swift
//  CountryApi
//
//  Created by Srikanth Kyatham on 12/12/24.
//

class CountryViewModel {
    private var countries: [Country] = []
    var filteredCountries: [Country] = []
    
    var reloadTableView: (() -> Void)?
    
    func fetchCountries() async {
        do {
            let url = ServerConstants.serverURL
            countries = try await NetworkManager.shared.fetchCountries(from: url, responseType: [Country].self)
            filteredCountries = countries
            reloadTableView?()
        } catch {
            print("Error fetching countries: \(error)")
        }
    }
    
    func searchCountries(by name: String) {
        if name.isEmpty {
            filteredCountries = countries
        } else {
            filteredCountries = countries.filter { $0.name.lowercased().contains(name.lowercased()) }
        }
        reloadTableView?()
    }
}
