//
//  OpenParenthesesUseCase.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 27/10/23.
//

import Foundation

struct OpenParenthesesUseCase {
    static func execute(result: inout ResultState) {
        let lastCharacter = result.input.lastCharacter()
        
        if result.input.isZero() {
            result.input = "("
        } else if !lastCharacter.isOperation() && !lastCharacter.isOpenParentheses() {
            result.input += "×("
        } else {
            result.input += "("
        }
    }
}
