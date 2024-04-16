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
        HStack {
            Button(action: {
                isLightMode.toggle()
            }, label: {
                ButtonView(size: 45, buttonSymbol: isLightMode ? .lightMode : .darkMode, bgColor: bgColor, fgColor: fgColor)
            })
            Spacer()
            Spacer()
        }
        .padding(.horizontal, 5)
    }
}

#Preview {
    LightDarkModeIndicatorView(isLightMode: .constant(true))
}
