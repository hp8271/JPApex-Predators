//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Harsh Pranay on 30/03/25.
//

import SwiftUI

struct ApexPredator: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: APType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String

    var image: String {
        return name.lowercased().replacingOccurrences(of: " ", with: "")
    }

    struct MovieScene: Decodable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }

    enum APType: String, Decodable {
        case land
        case air
        case sea

        var background: Color {
            switch self {
                case .land :
                    return .brown
                case .air:
                    return .teal
                case .sea:
                    return .blue
            }
        }
    }
}
