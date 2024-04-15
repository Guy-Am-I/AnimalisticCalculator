//
//  ComputationView.swift
//  AnimalisticCalculator
//
//  Created by Guy Steinberg on 2024-04-15.
//

import SwiftUI

struct ComputationView: View {
    let currentComputation: String
    let mainResult: String
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Spacer()
                Text(currentComputation)
                    .foregroundStyle(Asset.textColorPrimary.color)
                    .lineLimit(1)
            }.minimumScaleFactor(0.1)
            HStack {
                Spacer()
                Text(mainResult)
                    .foregroundStyle(Asset.textColorPrimary.color)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .lineLimit(1)
            }.minimumScaleFactor(0.1)
        }.padding(.horizontal)
    }
}

#Preview {
    ComputationView(currentComputation: "5 1231241234123412341234123412341234231412341231", mainResult: "6")
}
