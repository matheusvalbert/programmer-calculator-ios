//
//  CloseParenthesesUseCase.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 27/10/23.
//

import Foundation

struct CloseParenthesesUseCase {
    static func execute(result: inout ResultState) {
        let lastCharacter = result.input.lastCharacter()
        
        if result.input.numberOfOpenParentheses() > result.input.numberOfCloseParentheses() && !lastCharacter.isOperation() && !lastCharacter.isOpenParentheses() {
            result.input += ")"
        }
    }
}
