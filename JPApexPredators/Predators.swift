//
//  Predators.swift
//  JPApexPredators
//
//  Created by Harsh Pranay on 30/03/25.
//

import Foundation

final class Predators {
    var apexPredators: [ApexPredator] = []
    var allApexPredators: [ApexPredator] = []

    init() {
        decodeApexPredatorData()
    }

    fileprivate func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
            } catch {
                print("Error Decoding Json Data: \(error)")
            }
        }
    }

    func search(for searchTerm: String) -> [ApexPredator] {
        if searchTerm.isEmpty {
            return apexPredators
        } else {
            return allApexPredators.filter {
                $0.name.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }

    func sort(by alphabeticalOrder: Bool) {
        apexPredators.sort { (predator1, predator2) in
            if alphabeticalOrder {
                return predator1.name < predator2.name
            } else {
                return predator1.id < predator2.id
            }
        }
    }


    func filter(by type: APType) {
        apexPredators = allApexPredators
        guard type != .all else {
            return
        }
        apexPredators = apexPredators.filter {
            $0.type == type
        }
    }
}
