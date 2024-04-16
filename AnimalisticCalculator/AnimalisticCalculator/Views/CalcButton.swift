//
//  CalcButton.swift
//  AnimalisticCalculator
//
//  Created by Guy Steinberg on 2024-04-15.
//

import SwiftUI


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
            ZStack {
                Text(text ?? "")
                Image(systemName: systemImage ?? "")
            }
            .font(.system(size: size * 0.4))
            .fontWeight(.semibold)
            .foregroundStyle(fgColor)
            .frame(width: size, height: size)
            .background(bgColor)
            .clipShape(Circle())
            .shadow(color: fgColor.opacity(0.2), radius: 10, x: 5, y: 5)
    }
}

#Preview {
    ButtonView(size: 100, buttonSymbol: .clear, bgColor: Asset.foregroundDigitButton.color, fgColor: Asset.textColorPrimary.color)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}

