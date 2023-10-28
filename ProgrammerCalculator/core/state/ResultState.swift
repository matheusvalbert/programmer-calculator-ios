//
//  ResultState.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 26/10/23.
//

import Foundation

struct ResultState {
    var hex = "0"
    var dec = "0"
    var oct = "0"
    var bin = "0"
    var input = "0"
    var base = BaseEvent.hex
    
    mutating func generateResults(result: Int) {
        hex = String(result, radix: 16).uppercased()
        dec = String(result)
        oct = String(result, radix: 8)
        bin = String(result, radix: 2)
    }
    
    mutating func generateOverflow() {
        hex = "Overflow"
        dec = "Overflow"
        oct = "Overflow"
        bin = "Overflow"
        input = "Overflow"
    }
}
