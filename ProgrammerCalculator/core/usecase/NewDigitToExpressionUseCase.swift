//
//  NewDigitToExpression.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 27/10/23.
//

import Foundation

struct NewDigitToExpressionUseCase {
    static func execute(result: inout ResultState, digit: String) {
        let lastCharacter = result.input.lastCharacter()
        
        if result.input.isZero() {
            result.input = digit
        } else if lastCharacter.isCloseParentheses() {
            result.input = "\(result.input)×\(digit)"
        } else {
            result.input += digit
        }
    }
}
