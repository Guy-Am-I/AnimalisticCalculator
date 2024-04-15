//
//  LightDarkModeIndicatorView.swift
//  AnimalisticCalculator
//
//  Created by Guy Steinberg on 2024-04-15.
//

import SwiftUI

struct LightDarkModeIndicatorView: View {
    @State var isLightMode: Bool = true
    
    var body: some View {
        HStack {
            Button(action: {isLightMode.toggle()}, label: {
                isLightMode ? Image(systemName: "moon") : Image(systemName: "sun.max")
            })
            .buttonStyle(CalcButton(color: Asset.foregroundDigitButton.color, size: .medium))
        }
        .environment(\.colorScheme, isLightMode ? .light : .dark)
    }
}

#Preview {
    LightDarkModeIndicatorView()
}
