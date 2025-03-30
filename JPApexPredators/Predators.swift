//
//  Predators.swift
//  JPApexPredators
//
//  Created by Harsh Pranay on 30/03/25.
//

import Foundation

final class Predators {
    var apexPredators: [ApexPredator] = []

    init() {
        decodeApexPredatorData()
    }

    fileprivate func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredator].self, from: data)

            } catch {
                print("Error Decoding Json Data: \(error)")
            }
        }
    }

}
