//
//  ComputationView.swift
//  AnimalisticCalculator
//
//  Created by Guy Steinberg on 2024-04-15.
//

import SwiftUI

struct ComputationView: View {
    let textSize: CGFloat = 50
    let currentComputation: String
    let mainResult: String
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 10) {
            Spacer()
            HStack {
                Text(currentComputation)
                    .foregroundStyle(Asset.textColorPrimary.color)
                    .font(.system(size: textSize * 0.6))
                    .lineLimit(1)
            }.minimumScaleFactor(0.1)
            HStack {
                Text(mainResult)
                    .foregroundStyle(Asset.textColorPrimary.color)
                    .font(.system(size: textSize))
                    .fontWeight(.semibold)
                    .lineLimit(1)
            }.minimumScaleFactor(0.1)
        }
        .frame(maxHeight: 200)
        .padding()
    }
}

#Preview {
    ComputationView(currentComputation: "5 1231241234123412341234123412341234231412341231", mainResult: "6")
}
