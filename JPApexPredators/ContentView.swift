//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Harsh Pranay on 30/03/25.
//

import SwiftUI
import MapKit

struct ContentView: View {

    var predators = Predators()

    @State var searchText: String = ""
    @State var isAlphabeticalSorted: Bool = false
    @State var currentFilterType: APType = .all

    var filteredPredators: [ApexPredator] {

        predators.filter(by: currentFilterType)

        predators.sort(by: isAlphabeticalSorted)

        return predators.search(for: searchText)
    }

    var body: some View {
        NavigationStack {
            List(filteredPredators) { predator in
                NavigationLink{
                    PredatorDetail(
                        predator: predator,
                        position: .camera(
                            MapCamera(
                                centerCoordinate: predator.location,
                                distance: 30000
                            )
                        )
                    )
                } label: {
                    PredatorCardView(predator: predator)
                }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.easeIn, value: searchText)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            isAlphabeticalSorted.toggle()
                        }
                    } label: {
                        Image(systemName: isAlphabeticalSorted ? "film" : "textformat")
                            .symbolEffect(.bounce, value: isAlphabeticalSorted)
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentFilterType) {
                            ForEach (APType.allCases) { type in
                                Label(type.rawValue.capitalized, systemImage: type.icon)
                                    .onTapGesture {
                                        currentFilterType = type
                                    }
                            }
                        }
                    } label : {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
