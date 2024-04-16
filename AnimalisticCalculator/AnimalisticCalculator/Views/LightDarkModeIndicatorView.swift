//
//  LightDarkModeIndicatorView.swift
//  AnimalisticCalculator
//
//  Created by Guy Steinberg on 2024-04-15.
//

import SwiftUI

struct LightDarkModeIndicatorView: View {
    //@Environment(\.colorScheme) var colorScheme
    @Binding var isLightMode: Bool
    
    let fgColor = Asset.textColorPrimary.color
    let bgColor = Asset.foregroundDigitButton.color
    
    var body: some View {
        HStack {
            Button(action: {
                isLightMode.toggle()
            }, label: {
                Image(systemName: isLightMode ? "moon" : "sun.max").foregroundStyle(fgColor)
            })
            .buttonStyle(CalcButton(size: 45, bgColor: bgColor, shadowColor: fgColor))
            Spacer()
            Spacer()
        }
        .padding(.horizontal, 5)
    }
}

#Preview {
    LightDarkModeIndicatorView(isLightMode: .constant(true))
}
