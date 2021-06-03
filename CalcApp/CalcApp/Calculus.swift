//
//  Calculus.swift
//  CalcApp
//
//  Created by Nikolay T on 01.06.2021.
//

import Foundation

enum TypeOfOperations {
    case addition
    case subtraction
    case multiplication
    case division
}

enum ErrorCalculus: Error {
    case divisionByZero
}

class Calculus {
    private static func addTwoNumbers<T: FloatingPoint> (num1: T, num2: T) -> T {
        return num1 + num2
    }
    
    private static func subTwoNumbers<T: FloatingPoint> (num1: T, num2: T) -> T {
        return num1 - num2
    }
    
    private static func multTwoNumbers<T: FloatingPoint> (num1: T, num2: T) -> T {
        return num1 * num2
    }
    
    private static func divTwoNumbers<T: FloatingPoint> (num1: T, num2: T) -> T {
        return num1 / num2
    }
    
    public static func calc<T: FloatingPoint> (firstNumber num1: T, secondNumber num2: T, typeOfOperation oper: TypeOfOperations) throws -> T{
        switch oper {
        case .addition:
            return addTwoNumbers(num1: num1, num2: num2)
        case .subtraction:
            return subTwoNumbers(num1: num1, num2: num2)
        case .multiplication:
            return multTwoNumbers(num1: num1, num2: num2)
        case .division:
            if num2 != 0 {
                return divTwoNumbers(num1: num1, num2: num2)
            } else {
                throw ErrorCalculus.divisionByZero
            }
        }
    }
}
