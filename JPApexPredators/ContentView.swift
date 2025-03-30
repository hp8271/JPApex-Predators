//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Harsh Pranay on 30/03/25.
//

import SwiftUI

struct ContentView: View {

    var predators = Predators()

    var filteredPredators: [ApexPredator] {
        if searchText.isEmpty {
            return predators.apexPredators
        } else {
            return predators.apexPredators.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    @State var searchText: String = ""
    var body: some View {
        NavigationStack {
            List(filteredPredators) { predators in
                NavigationLink{

                } label: {
                    PredatorCardView(predator: predators)
                }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.easeIn, value: searchText)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
