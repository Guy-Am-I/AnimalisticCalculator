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
    let buttonWidthPct = UIDevice.isIpad ? 0.17 : 0.2
    @Binding var expression: String
    @Binding var mainResult: String
    
    let buttonGrid: [RowOfCalcButtonModel] = [
        RowOfCalcButtonModel(row: [
            CalcButtonModel(icon: .clear, bgColor: Asset.textColorPrimary.color, fgColor: Asset.textColorSecondary.color),
            CalcButtonModel(icon: .negative, bgColor: Asset.foregroundActionButton.color),
            CalcButtonModel(icon: .percentImg, bgColor: Asset.foregroundActionButton.color),
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
            let buttonSize = geo.size.width * buttonWidthPct
            VStack {
                Grid(horizontalSpacing: 0, verticalSpacing: 20) {
                    ForEach(buttonGrid) { buttonRow in
                        GridRow {
                            ForEach(buttonRow.row) { buttonModel in
                                Button(action: {
                                    buttonPressed(button: buttonModel.icon)
                                }, label: {
                                    ButtonView(size: buttonSize, buttonSymbol: buttonModel.icon, bgColor: buttonModel.bgColor, fgColor: buttonModel.fgColor)
                                })
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
    
    func buttonPressed(button: ButtonSymbol) {
        switch button {
        case .clear:
            expression = ""
            mainResult = "0"
        case .equal, .negative:
            if !expression.isEmpty {
                if isLastCharDigit(of: expression){
                    let sign = button == .negative ? -1.0 : 1.0
                    
                    mainResult = formatResult(val: sign * calculateResults())
                    
                    if button == .negative {
                        expression = mainResult
                    }
                }
            }
        case .decimal:
            if let lastDecimalInExpr = expression.lastIndex(of: ".") {
                if isLastCharDigit(of: expression) {
                    let startIndex = expression.index(lastDecimalInExpr, offsetBy: 1)
                    let range = startIndex..<expression.endIndex
                    
                    let afterDecimalValue = String(expression[range])
                    
                    // Don't allow 2 decimal points for a single number
                    if !afterDecimalValue.isEmpty && Int(afterDecimalValue) != nil {
                        appendToExpression(.decimal)
                    }
                }
            } 
            else if expression.isEmpty {
                expression += "0."
            } else {
                appendToExpression(.decimal)
            }
        case .backspace:
            expression = String(expression.dropLast())
        case .percentImg:
            if isLastCharDigit(of: expression) {
                appendToExpression(enumOperatorImgToText(button))
            }
        case _ where enumDigits.contains(button):
            appendToExpression(button)
        case _ where enumOperators.contains(button):
            if isLastCharDigit(of: expression) {
                appendToExpression(enumOperatorImgToText(button))
            }
        default:
            print("Default")
        }
    }
    
    func calculateResults() -> Double {
        let currentExpression: String = expression
        
        var calculating = currentExpression.replacingOccurrences(of: "%", with: "*0.01")
        calculating = calculating.replacingOccurrences(of: "×", with: "*")
        calculating = calculating.replacingOccurrences(of: "÷", with: "/")
        
        if getLastChar(str: currentExpression) == "." {
            calculating += "0"
        }
        
        let expr = NSExpression(format: calculating)
        return expr.expressionValue(with: nil, context: nil) as! Double
    }
    
    func isLastCharDigit(of str: String) -> Bool {
        let last = getLastChar(str: str)
        return last == "%" || Double(last) != nil
    }
    
    func appendToExpression(_ button: ButtonSymbol) {
        expression += button.rawValue
    }
}

#Preview {
    CalcButtonsView(expression: .constant("5"), mainResult: .constant("5"))
}
