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
    var bgColor: Color = Asset.foregroundDigitButton.color
    var fgColor: Color = Asset.textColorPrimary.color
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
            CalcButtonModel(icon: .clear, bgColor: Asset.textColorPrimary.color, fgColor: Asset.textColorSecondary.color),
            CalcButtonModel(icon: .paren, bgColor: Asset.foregroundActionButton.color),
            CalcButtonModel(icon: .percent, bgColor: Asset.foregroundActionButton.color),
            CalcButtonModel(icon: .divide, bgColor: Asset.foregroundActionButton.color)
        ]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(icon: .seven),
            CalcButtonModel(icon: .eight),
            CalcButtonModel(icon: .nine),
            CalcButtonModel(icon: .multiply, bgColor: Asset.foregroundActionButton.color)
        ]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(icon: .four),
            CalcButtonModel(icon: .five),
            CalcButtonModel(icon: .six),
            CalcButtonModel(icon: .subtract, bgColor: Asset.foregroundActionButton.color)
        ]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(icon: .one),
            CalcButtonModel(icon: .two),
            CalcButtonModel(icon: .three),
            CalcButtonModel(icon: .add, bgColor: Asset.foregroundActionButton.color)
        ]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(icon: .zero),
            CalcButtonModel(icon: .comma),
            CalcButtonModel(icon: .backspace),
            CalcButtonModel(icon: .equal, bgColor: Asset.foregroundEqualButton.color)
        ])
    ]
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Grid() {
                    ForEach(buttonGrid) { buttonRow in
                        GridRow {
                            ForEach(buttonRow.row) { buttonModel in
                                ButtonView(size: geo.size.width * 0.2, buttonSymbol: buttonModel.icon, bgColor: buttonModel.bgColor, fgColor: buttonModel.fgColor)
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
