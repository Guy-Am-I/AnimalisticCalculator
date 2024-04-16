//
//  CalcButton.swift
//  AnimalisticCalculator
//
//  Created by Guy Steinberg on 2024-04-15.
//

import SwiftUI

struct CalcButton: ButtonStyle {
    let size: CGFloat
    let bgColor: Color
    let shadowColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: size, height: size)
            .background(bgColor)
            .clipShape(Circle())
            .shadow(color: shadowColor.opacity(0.2), radius: 10, x: 10, y: 10)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


struct ButtonView: View {
    let size: CGFloat
    let buttonSymbol: ButtonSymbol
    let bgColor: Color
    let fgColor: Color
    
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
            .font(.system(size: size * 0.4))
            .fontWeight(.semibold)
            .foregroundStyle(fgColor)
        })
        .buttonStyle(CalcButton(size: size, bgColor: bgColor, shadowColor: fgColor))
        
    }
}

#Preview {
    ButtonView(size: 100, buttonSymbol: .divide, bgColor: Asset.foregroundDigitButton.color, fgColor: Asset.textColorPrimary.color)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}

