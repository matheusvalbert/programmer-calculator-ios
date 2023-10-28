//
//  InputEvent.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 27/10/23.
//

import Foundation

enum InputEvent {
    case digit(String)
    case operation(String)
    case clear
    case openParentheses
    case closeParentheses
    case shl
    case shr
    case delete
    case equal
}
