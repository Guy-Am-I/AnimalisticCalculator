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
                Image(systemName: isLightMode ? "moon" : "sun.max").foregroundStyle(Asset.textColorPrimary.color)
            })
            .buttonStyle(CalcButton(color: Asset.foregroundDigitButton.color))
            Spacer()
            Spacer()
        }
        .environment(\.colorScheme, isLightMode ? .light : .dark)
    }
}

#Preview {
    LightDarkModeIndicatorView()
}
