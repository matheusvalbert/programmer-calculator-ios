//
//  ChangeBase.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 26/10/23.
//

import Foundation

struct ChangeBaseUseCase {
    static func execute(result: inout ResultState, event: BaseEvent) {
        result.base = event
        switch event {
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
