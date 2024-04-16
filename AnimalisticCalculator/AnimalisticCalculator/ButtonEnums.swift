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
    case comma = ","
    case decimal = "."
    
    case backspace = "IMGdelete.left"
    case add = "IMGplus"
    case subtract = "IMGminus"
    case multiply = "IMGmultiply"
    case divide = "IMGdivide"
    case equal = "IMGequal"
    case paren = "IMGparentheses"
    case percent = "IMGpercent"
}


let enumOperators: [ButtonSymbol] = [.subtract, .add, .multiply, .divide]


