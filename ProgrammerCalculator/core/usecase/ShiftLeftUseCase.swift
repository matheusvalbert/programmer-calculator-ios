//
//  ShiftLeftUseCase.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 27/10/23.
//

import Foundation

struct ShiftLeftUseCase {
    static func execute(result: inout ResultState) {
        if !result.input.isZero() {
            result.input += "0"
        }
    }
}
