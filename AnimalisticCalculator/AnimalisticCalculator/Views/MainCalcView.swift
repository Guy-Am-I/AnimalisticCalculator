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
                Spacer()
                ComputationView(currentComputation: currentComputation, mainResult: mainResult)
                LightDarkModeIndicatorView()
                Spacer()
                CalcButtonsView(currentComputation: $currentComputation, mainResult: $mainResult)
                Spacer()
            }.padding()
        }
    }
}

#Preview {
    MainCalcView()
        .preferredColorScheme(.dark)
}
