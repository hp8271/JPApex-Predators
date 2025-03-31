//
//  PredatorDetail.swift
//  JPApexPredators
//
//  Created by Harsh Pranay on 31/03/25.
//

import SwiftUI

struct PredatorDetail: View {
    @State var predator: ApexPredator

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
                    Text(predator.name)
                        .font(.largeTitle)

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
        }
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[4])
        .preferredColorScheme(.dark)
}
