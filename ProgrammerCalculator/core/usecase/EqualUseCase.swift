//
//  EqualUseCase.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 27/10/23.
//

import Foundation

struct EqualUseCase {
    static func execute(result: inout ResultState) {
        switch result.base {
        case .hex:
            result.input = result.hex
        case .dec:
            result.input = result.dec
        case .oct:
            result.input = result.oct
        case .bin:
            result.input = result.bin
        }
    }
}
