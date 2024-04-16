//
//  ButtonEnums.swift
//  AnimalisticCalculator
//
//  Created by Guy Steinberg on 2024-04-15.
//

import Foundation
import SwiftUI

enum Operation {
    case add, subtract, multiply, divide, equal, none
}

enum ButtonSymbol: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case clear = "AC"
    case decimal = "."
    case add = "+"
    case subtract = "-"
    case multiply = "×"
    case divide = "÷"
    
    case backspace = "IMGdelete.left"
    case equal = "IMGequal"
    case percent = "IMGpercent"
    
    case addImg = "IMGplus"
    case subtractImg = "IMGminus"
    case multiplyImg = "IMGmultiply"
    case divideImg = "IMGdivide"
    
    case dog = "IMGdog"
    case lightMode = "IMGsun.max"
    case darkMode = "IMGmoon"
}

let enumDigits: [ButtonSymbol] = [.one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero]
let enumOperators: [ButtonSymbol] = [.subtract, .add, .multiply, .divide, .subtractImg, .addImg, .multiplyImg, .divideImg]

func enumOperatorImgToText(_ operatorImg: ButtonSymbol) -> ButtonSymbol {
    switch operatorImg {
    case .addImg:
        return .add
    case .subtractImg:
        return .subtract
    case .multiplyImg:
        return .multiply
    case .divideImg:
        return .divide
    default:
        return .zero
    }
}


