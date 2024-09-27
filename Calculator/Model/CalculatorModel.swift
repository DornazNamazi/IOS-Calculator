//
//  CalculatorModel.swift
//  Calculator
//
//  Created by english on 2024-09-23.
//

import Foundation
import SwiftUI


enum Keys: String{
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
    
    case add  = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "x"
    case equal = "="
    
    
    case clear = "AC"
    case decimal = "."
    case negetive = "-/+"
    case percent = "%"
    
    
    var buttonColor: Color {
        switch self{
        case .add, .substract, .multiply, .divide, .equal:
            return Color.voperator
        case .clear, .negetive, .percent:
            return Color.hoperator
        default:
            return Color.num
        }
    }
}


enum Operation{
    case add, subscrapt, multiply, divide, none
    
}
