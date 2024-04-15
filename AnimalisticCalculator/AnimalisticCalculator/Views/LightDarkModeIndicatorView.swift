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
            Button(action: {}, label: {
                Image("moon")
            })
            .buttonStyle(CalcButton(color: .blue, size: .medium))
        }
    }
}

#Preview {
    LightDarkModeIndicatorView()
}
