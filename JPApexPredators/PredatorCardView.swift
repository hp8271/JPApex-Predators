//
//  SwiftUIView.swift
//  JPApexPredators
//
//  Created by Harsh Pranay on 30/03/25.
//

import SwiftUI

struct PredatorCardView: View {
    var predator: ApexPredator

    var body: some View {
        HStack {
            Image(predator.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(color: .white, radius: 1)
            VStack(alignment: .leading) {

                Text(predator.name)
                    .fontWeight(.bold)

                Text(predator.type.rawValue.capitalized)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 13)
                    .padding(.vertical, 5)
                    .background(predator.type.background)
                    .clipShape(.capsule)


            }
        }
    }
}

#Preview {

//    PredatorCardView()
}
