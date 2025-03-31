//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Harsh Pranay on 30/03/25.
//

import SwiftUI
import MapKit

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

    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    struct MovieScene: Decodable,Identifiable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
}

enum APType: String, Decodable, CaseIterable, Identifiable {
    case all
    case land
    case air
    case sea

    var id: APType {
        self
    }

    var background: Color {
        switch self {
        case .land :
            return .brown
        case .air:
            return .teal
        case .sea:
            return .blue
        case .all:
            return .black
        }
    }

    var icon: String {
        switch self {
            case .land :
                return "leaf.fill"
            case .air:
                return "wind"
            case .sea:
                return "drop.fill"
            case .all:
                return "square.stack.3d.up.fill"
        }
    }
}
