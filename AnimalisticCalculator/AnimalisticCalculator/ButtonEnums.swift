//
//  ButtonEnums.swift
//  AnimalisticCalculator
//
//  Created by Guy Steinberg on 2024-04-15.
//

import Foundation

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
}

enum ButtonSymbolImage: String {
    case backspace = "delete.left"
    case add = "plus"
    case subtract = "minus"
    case multiply = "multiply"
    case divide = "divide"
    case equal = "equal"
    case paren = "parentheses"
    case percent = "percent"
}

let enumOperators: [ButtonSymbolImage] = [.subtract, .add, .multiply, .divide]


