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
            .padding()
            .background(color)
            .clipShape(Circle())
    }
}
