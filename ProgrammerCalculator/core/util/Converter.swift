//
//  Converter.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 27/10/23.
//

import Foundation

struct Converter {
    
    static func convert(expression: String, base: BaseEvent) throws -> String {
        var expression = expression
        removeOpenParenthesesInTheEnd(expression: &expression)
        removeLastCharacterIfWasAnOperator(expression: &expression)
        addCloseParentheses(expression: &expression)
        replaceOperatorCharacter(expression: &expression)
        checkIfIsNotEmpty(expression: &expression)
        let splitedExpression = splitExpression(expression: expression)
        return try changeToBase10(splitExpression: splitedExpression, base: base)
    }
    
    static private func removeOpenParenthesesInTheEnd(expression: inout String) {
        while(!expression.isEmpty && expression.lastCharacter().isOpenParentheses()) {
            expression = String(describing: expression.dropLast(1))
        }
        
        if expression.isEmpty {
            expression = "0"
        }
    }
    
    static private func addCloseParentheses(expression: inout String) {
        let numberOfMissingCloseParentheses = expression.numberOfOpenParentheses() - expression.numberOfCloseParentheses()
        expression += String(repeating: ")", count: numberOfMissingCloseParentheses)
    }
    
    static private func removeLastCharacterIfWasAnOperator(expression: inout String) {
        if expression.lastCharacter().isOperation() {
            expression = String(describing: expression.dropLast(1))
        }
    }
    
    static private func replaceOperatorCharacter(expression: inout String) {
        expression = expression
            .replacingOccurrences(of: "÷", with: "/")
            .replacingOccurrences(of: "×", with: "*")
    }
    
    static private func checkIfIsNotEmpty(expression: inout String) {
        if expression.isEmpty {
            expression = "0"
        }
    }
    
    static private func splitExpression(expression: String) -> [String] {
        var result = [String]()
        var currentPart = String()

        expression.enumerated().forEach { (index, char) in
            let isNumOrLetter = char.isNumber || char.isLetter

            if index != 0 && isNumOrLetter != (expression[expression.index(expression.startIndex, offsetBy: index - 1)].isNumber ||
                                               expression[expression.index(expression.startIndex, offsetBy: index - 1)].isLetter) {
                result.append(currentPart)
                currentPart = ""
            }
            currentPart.append(char)
        }
        result.append(currentPart)

        return result
    }
    
    static private func changeToBase10(splitExpression: [String], base: BaseEvent) throws -> String {
        var expression = ""

        try splitExpression.forEach { element in
            guard let firstElement = element.first else { throw NSError(domain: "com.matheusvalbert.programmercalculator", code: 1) }
            if !firstElement.isNumber && !firstElement.isLetter {
                expression += element
                return
            }
            switch base {
            case .hex:
                guard let hexResult = Int(element, radix: 16) else { throw NSError(domain: "com.matheusvalbert.programmercalculator", code: 1) }
                expression += String(hexResult)
            case .dec:
                expression += element
            case .oct:
                guard let octResult = Int(element, radix: 8) else { throw NSError(domain: "com.matheusvalbert.programmercalculator", code: 1) }
                expression += String(octResult)
            case .bin:
                guard let binResult = Int(element, radix: 2) else { throw NSError(domain: "com.matheusvalbert.programmercalculator", code: 1) }
                expression += String(binResult)
            }
        }

        return expression
    }
}
