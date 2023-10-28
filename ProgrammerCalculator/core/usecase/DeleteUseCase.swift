//
//  DeleteUseCase.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 27/10/23.
//

import Foundation

struct DeleteUseCase {
    static func execute(result: inout ResultState) {
        if result.input.isZero() || result.input.count == 1 {
            result.input = "0"
        } else {
            result.input = String(describing: result.input.dropLast(1))
        }
    }
}
