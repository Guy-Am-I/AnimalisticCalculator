//
//  LightDarkModeIndicatorView.swift
//  AnimalisticCalculator
//
//  Created by Guy Steinberg on 2024-04-15.
//

import SwiftUI

struct LightDarkModeIndicatorView: View {
    @Binding var isLightMode: Bool
    
    let fgColor = Asset.textColorPrimary.color
    let bgColor = Asset.foregroundDigitButton.color
    
    var body: some View {
        Button(action: {
            isLightMode.toggle()
        }, label: {
            ButtonView(size: UIDevice.isIpad ? 80 : 50, buttonSymbol: isLightMode ? .lightMode : .darkMode, bgColor: bgColor, fgColor: fgColor)
        })
    }
}

#Preview {
    LightDarkModeIndicatorView(isLightMode: .constant(true))
}
