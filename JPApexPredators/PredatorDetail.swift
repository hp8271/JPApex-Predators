//
//  PredatorDetail.swift
//  JPApexPredators
//
//  Created by Harsh Pranay on 31/03/25.
//

import SwiftUI
import MapKit

struct PredatorDetail: View {
    @State var predator: ApexPredator
    @State var position: MapCameraPosition

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    // Background image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            LinearGradient(
                                stops: [Gradient.Stop(color: .clear, location: 0.8),
                                        Gradient.Stop(color: .black, location: 1)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        }

                    // Dino Image

                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width/1.5, height: geometry.size.height/3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .brown, radius: 7, x: 0, y: 10 )
                        .offset(y: 20)
                }

                VStack(alignment: .leading) {
                    // Dino Name
                    Text(predator.name)
                        .font(.largeTitle)

                    // Map
                    NavigationLink {
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                    } label: {
                        Map(initialPosition: position) {
                            Annotation(
                                predator.name,
                                coordinate: predator.location
                            ) {
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                    .symbolEffect(.pulse)
                            }
                            .annotationTitles(.hidden)
                        }
                        .frame(height: 125)
                        .clipShape(.rect(cornerRadius: 15))
                        .overlay(alignment: .trailing) {
                            Image(systemName: "greaterthan")
                                .imageScale(.large)
                                .font(.title3)
                                .padding(.trailing, 5)
                        }
                        .overlay(alignment: .topLeading) {
                            Text("Current Location")
                                .padding([.leading, .bottom], 5)
                                .padding(.trailing, 8)
                                .background(.black.opacity(0.33))
                                .clipShape(.rect(topLeadingRadius: 15, bottomTrailingRadius: 15))
                        }
                    }
                    // Appears in
                    Text("Appears in:")
                        .underline()

                    ForEach(predator.movies, id: \.self) { movie in
                        Text("• " + movie)
                    }

                    Text("\nMovie Moments")
                        .font(.title)
                        .padding(.top, 15)
                        .underline()

                    ForEach(predator.movieScenes) { scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding(.vertical, 1)

                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)

                    }

                    Text("Read More")
                        .font(.caption)
                    Link(predator.link, destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundStyle(.blue)
                }
                .padding()
                .padding(.bottom)
                .frame(width: geometry.size.width, alignment: .leading)
            }
            .ignoresSafeArea()
            .toolbarBackground(.automatic)
        }
    }
}

#Preview {
    let predator = Predators().apexPredators[8]
    NavigationStack {
        PredatorDetail(
            predator: predator,
            position: .camera(
                MapCamera(
                    centerCoordinate: predator.location,
                    distance: 30000
                )
            )
        )
        .preferredColorScheme(.dark)
    }
}
