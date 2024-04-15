//
//  ComputationView.swift
//  AnimalisticCalculator
//
//  Created by Guy Steinberg on 2024-04-15.
//

import SwiftUI

struct ComputationView: View {
    let currentComputation: String
    let mainResult: String
    
    var body: some View {
        VStack {
            Text(currentComputation)
            Text(mainResult)
        }
    }
}

#Preview {
    ComputationView(currentComputation: "5 + 1", mainResult: "6")
}
