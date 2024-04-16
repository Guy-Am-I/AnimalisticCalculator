//
//  CalcButton.swift
//  AnimalisticCalculator
//
//  Created by Guy Steinberg on 2024-04-15.
//

import SwiftUI

struct CalcButton: ButtonStyle {
    let bgColor: Color
    let shadowColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .controlSize(.large)
            .background(bgColor)
            .clipShape(Circle())
            .shadow(color: shadowColor, radius: 20)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


struct ButtonView: View {
    let buttonSymbol: ButtonSymbol
    let bgColor: Color = Asset.foregroundDigitButton.color
    let fgColor: Color = Asset.textColorPrimary.color
    
    var systemImage: String? {
        let val = buttonSymbol.rawValue
        return val.starts(with: "IMG") ?
        val.replacingOccurrences(of: "IMG", with: "") :
        nil
    }
    
    var text: String? {
        let val = buttonSymbol.rawValue
        return val.starts(with: "IMG") ? nil : val
    }
    
    var body: some View {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                ZStack {
                    Text(text ?? "")
                    Image(systemName: systemImage ?? "")
                }
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(fgColor)
            })
            .buttonStyle(CalcButton(bgColor: bgColor, shadowColor: fgColor))
    }
}

#Preview {
    ButtonView(buttonSymbol: .divide)
}

