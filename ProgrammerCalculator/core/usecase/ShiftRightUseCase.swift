//
//  ShiftRightUseCase.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 27/10/23.
//

import Foundation

struct ShiftRightUseCase {
    static func execute(result: inout ResultState) {
        if result.input == "1" {
            result.input = "0"
        } else if !result.input.isZero() {
            result.input = String(describing: result.input.dropLast(1))
        }
    }
}
