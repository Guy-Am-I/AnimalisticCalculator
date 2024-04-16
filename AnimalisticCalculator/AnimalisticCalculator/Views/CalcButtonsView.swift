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
            CalcButtonModel(icon: .dog, bgColor: Asset.foregroundActionButton.color),
            CalcButtonModel(icon: .percent, bgColor: Asset.foregroundActionButton.color),
            CalcButtonModel(icon: .divideImg, bgColor: Asset.foregroundActionButton.color)
        ]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(icon: .seven),
            CalcButtonModel(icon: .eight),
            CalcButtonModel(icon: .nine),
            CalcButtonModel(icon: .multiplyImg, bgColor: Asset.foregroundActionButton.color)
        ]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(icon: .four),
            CalcButtonModel(icon: .five),
            CalcButtonModel(icon: .six),
            CalcButtonModel(icon: .subtractImg, bgColor: Asset.foregroundActionButton.color)
        ]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(icon: .one),
            CalcButtonModel(icon: .two),
            CalcButtonModel(icon: .three),
            CalcButtonModel(icon: .addImg, bgColor: Asset.foregroundActionButton.color)
        ]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(icon: .backspace),
            CalcButtonModel(icon: .zero),
            CalcButtonModel(icon: .decimal),
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
                                Button(action: {
                                    buttonPressed(value: buttonModel.icon)
                                }, label: {
                                    ButtonView(size: geo.size.width * 0.2, buttonSymbol: buttonModel.icon, bgColor: buttonModel.bgColor, fgColor: buttonModel.fgColor)
                                })
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
    
    func buttonPressed(value: ButtonSymbol) {
        
        switch value {
        case .clear:
            currentComputation = ""
            mainResult = "0"
        case .equal:
            print("=")
        case .decimal:
            print(".")
        case .backspace:
            currentComputation = String(currentComputation.dropLast())
        case .percent:
            print("percent")
        case _ where enumDigits.contains(value):
            currentComputation += value.rawValue
        case _ where enumOperators.contains(value):
            if Double(getLastChar(str: currentComputation)) != nil {
                currentComputation += enumOperatorImgToText(value).rawValue
            } else {
                //invalid
            }
        default:
            print("Default")
        }
    }
}

#Preview {
    CalcButtonsView(currentComputation: .constant("5"), mainResult: .constant("5"))
}
