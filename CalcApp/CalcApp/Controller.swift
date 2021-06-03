//
//  Controller.swift
//  CalcApp
//
//  Created by Nikolay T on 01.06.2021.
//

import Foundation

class controllerfCalculator {
    private var firstNumber: Float?
    private var secondNumber: Float?
    private var action: TypeOfOperations?
    //public var isError: Bool
    //public var errorMessage: String
    
    /// Инициализатор по умолчанию
    ///
    /// - warning: После вызова функции action становится nil
    init() {
        self.firstNumber = nil
        self.secondNumber = nil
        self.action = nil
//        self.isError = false
//        self.errorMessage = ""
    }
    
    /// Метод сброса значений
    ///
    /// - warning: После вызова функции action становится nil
    public func resetValues() {
        self.firstNumber = nil
        self.secondNumber = nil
        self.action = nil
//        self.isError = false
//        self.errorMessage = ""
    }
    
    /// Метод для установки типа операции
    public func setAction(inputAction a: TypeOfOperations) {
        self.action = a
    }
    
    /// Метод сохраняет введенные пользователем числа
    ///
    /// - parameter inputNumber: Optional строка из поля ввода
    public func getNumber(inputNumber num: String?) throws {
        guard let _ = num else { return }
                
        if self.firstNumber == nil {
            self.firstNumber = Float(num!)
        } else if self.secondNumber == nil {
            self.secondNumber = Float(num!)
            self.firstNumber = try Calculus.calc(firstNumber: self.firstNumber!, secondNumber: self.secondNumber!, typeOfOperation: self.action!)
            self.secondNumber = nil
        }
    }
    /// Метод возвращает текущую операцию
    ///
    /// - returns: Возвращает текущую операцию или nil
    public func getCurrentAction() -> TypeOfOperations? {
        return self.action
    }
    
    /// Метод возвращает результаты вычислений
    ///
    /// - returns: Возвращает дробное число или nil
    public func getResult() -> Float? {
        return self.firstNumber
    }
    
    /// Метод для передачи сообщения в UIAlertController
    ///
    public func sendMessageToAlert(text: String) -> String {
        return text
    }
}
