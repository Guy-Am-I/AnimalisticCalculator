//
//  CalcButtonsView.swift
//  AnimalisticCalculator
//
//  Created by Guy Steinberg on 2024-04-15.
//

import SwiftUI

struct CalcButtonsView: View {
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    var body: some View {
        HStack {
            Text(currentComputation)
            Text(mainResult)
        }
    }
}

#Preview {
    CalcButtonsView(currentComputation: .constant("5"), mainResult: .constant("5"))
}
