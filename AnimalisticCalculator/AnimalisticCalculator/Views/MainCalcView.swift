//
//  MainCalcView.swift
//  AnimalisticCalculator
//
//  Created by Guy Steinberg on 2024-04-15.
//

import SwiftUI

struct MainCalcView: View {
    @State var lightMode: Bool = true
    @State var currentComputation: String = ""
    @State var mainResult: String = "0"
    
    var body: some View {
        ZStack {
            Asset.backgroundPrimary.color
                .ignoresSafeArea()
            VStack {
                LightDarkModeIndicatorView(isLightMode: $lightMode)
                Spacer()
                Spacer()
                ComputationView(currentComputation: currentComputation, mainResult: mainResult)
                Spacer()
                CalcButtonsView(expression: $currentComputation, mainResult: $mainResult)
            }
            .padding()
        }
        .environment(\.colorScheme, lightMode ? .light : .dark)
    }
}

#Preview {
    MainCalcView(currentComputation: "98898989898989898989889898989898989", mainResult: "98898989898989898989889898989898989")
}
