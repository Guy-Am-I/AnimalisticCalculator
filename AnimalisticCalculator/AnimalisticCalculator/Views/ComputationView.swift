//
//  ComputationView.swift
//  AnimalisticCalculator
//
//  Created by Guy Steinberg on 2024-04-15.
//

import SwiftUI

struct ComputationView: View {
    let textSize: CGFloat = UIDevice.isIpad ? 150 : 80
    let currentComputation: String
    let mainResult: String
    
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                Text(currentComputation)
                    .foregroundStyle(Asset.textColorPrimary.color)
                    .font(.system(size: textSize * 0.5))
                    .lineLimit(1)
                    .frame(height: textSize * 0.5)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
            .minimumScaleFactor(0.1)
            HStack {
                Text(mainResult)
                    .foregroundStyle(Asset.textColorPrimary.color)
                    .font(.system(size: textSize))
                    .fontWeight(.semibold)
                    .lineLimit(1)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
            .minimumScaleFactor(0.1)
        }
    }
}

#Preview {
    ComputationView(currentComputation: "5 1231241234123412341234123412341234231412341231", mainResult: "6")
}
