//
//  NewOperationToExpression.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 27/10/23.
//

import Foundation

struct NewOperationToExpressionUseCase {
    static func execute(result: inout ResultState, operation: String) {
        let lastCharacter = result.input.lastCharacter()
        
        if result.input.isZero() || lastCharacter.isOpenParentheses() {
            return
        } else if lastCharacter.isOperation() {
            result.input = result.input.dropLast() + operation
        } else {
            result.input += operation
        }
    }
}
