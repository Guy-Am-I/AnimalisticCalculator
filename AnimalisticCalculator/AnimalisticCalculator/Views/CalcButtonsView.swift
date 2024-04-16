//
//  CalcButtonsView.swift
//  AnimalisticCalculator
//
//  Created by Guy Steinberg on 2024-04-15.
//

import SwiftUI

struct CalcButtonModel: Identifiable {
    let id = UUID()
    let icon: ButtonSymbol
    var color: Color = Asset.foregroundDigitButton.color
}

struct RowOfCalcButtonModel: Identifiable {
    let id = UUID()
    let row: [CalcButtonModel]
}

struct CalcButtonsView: View {
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    let buttonGrid: [RowOfCalcButtonModel] = [
        RowOfCalcButtonModel(row: [
            CalcButtonModel(icon: .clear, color: Asset.textColorPrimary.color),
            CalcButtonModel(icon: .paren, color: Asset.foregroundActionButton.color),
            CalcButtonModel(icon: .percent, color: Asset.foregroundActionButton.color),
            CalcButtonModel(icon: .divide, color: Asset.foregroundActionButton.color)
        ]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(icon: .seven),
            CalcButtonModel(icon: .eight),
            CalcButtonModel(icon: .nine),
            CalcButtonModel(icon: .multiply, color: Asset.foregroundActionButton.color)
        ]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(icon: .four),
            CalcButtonModel(icon: .five),
            CalcButtonModel(icon: .six),
            CalcButtonModel(icon: .subtract, color: Asset.foregroundActionButton.color)
        ]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(icon: .one),
            CalcButtonModel(icon: .two),
            CalcButtonModel(icon: .three),
            CalcButtonModel(icon: .add, color: Asset.foregroundActionButton.color)
        ]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(icon: .zero),
            CalcButtonModel(icon: .comma),
            CalcButtonModel(icon: .backspace),
            CalcButtonModel(icon: .equal, color: Asset.foregroundEqualButton.color)
        ])
    ]
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                LightDarkModeIndicatorView()
                Grid() {
                    ForEach(buttonGrid) { buttonRow in
                        GridRow {
                            ForEach(buttonRow.row) { buttonModel in
                                ButtonView(size: geo.size.width * 0.2, buttonSymbol: buttonModel.icon, bgColor: buttonModel.color, fgColor: Asset.textColorPrimary.color)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                    }
                }
            }
            .frame(alignment: .bottom)
        }
    }
}

#Preview {
    CalcButtonsView(currentComputation: .constant("5"), mainResult: .constant("5"))
}
