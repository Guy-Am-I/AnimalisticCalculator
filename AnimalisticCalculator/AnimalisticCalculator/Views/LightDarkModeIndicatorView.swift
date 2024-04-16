//
//  LightDarkModeIndicatorView.swift
//  AnimalisticCalculator
//
//  Created by Guy Steinberg on 2024-04-15.
//

import SwiftUI

struct LightDarkModeIndicatorView: View {
    @State var isLightMode: Bool = true
    let fgColor = Asset.textColorPrimary.color
    let bgColor = Asset.foregroundDigitButton.color
    
    var body: some View {
        HStack {
            Button(action: {isLightMode.toggle()}, label: {
                Image(systemName: isLightMode ? "moon" : "sun.max").foregroundStyle(fgColor)
            })
            .buttonStyle(CalcButton(bgColor: bgColor, shadowColor: fgColor))
            Spacer()
            Spacer()
        }
        .environment(\.colorScheme, isLightMode ? .light : .dark)
    }
}

#Preview {
    LightDarkModeIndicatorView()
}
