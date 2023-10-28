//
//  ClearUseCase.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 27/10/23.
//

import Foundation

struct ClearUseCase {
    static func execute(result: inout ResultState) {
        result = ResultState(base: result.base)
    }
}
