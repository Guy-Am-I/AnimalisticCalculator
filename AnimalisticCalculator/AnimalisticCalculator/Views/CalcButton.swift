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

struct CalcButton: View {
    let color: Color
    let size: ButtonSizes
    let image: String
    
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Image(systemName: image)
        })
    }
}

#Preview {
    CalcButton(color: .black, size: .medium, image: "dog.fill")
}
