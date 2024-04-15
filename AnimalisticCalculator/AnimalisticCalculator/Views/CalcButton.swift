//
//  CalcButton.swift
//  AnimalisticCalculator
//
//  Created by Guy Steinberg on 2024-04-15.
//

import SwiftUI

enum ButtonSizes {
    case small, medium, large
}

struct CalcButton: ButtonStyle {
    let color: Color
    let size: ButtonSizes
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 200, height: 200)
            .background(color)
            .clipShape(Circle())
            .shadow(radius: 20)
    }
}
