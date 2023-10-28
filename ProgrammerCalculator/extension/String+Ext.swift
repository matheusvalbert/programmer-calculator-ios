//
//  String+Ext.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 27/10/23.
//

import Foundation

extension String {
    
    func lastCharacter() -> String {
        return self.last.map(String.init)!
    }
    
    func isZero() -> Bool {
        return self == "0" ? true : false
    }
    
    func isOpenParentheses() -> Bool {
        return self == "("
    }
    
    func isCloseParentheses() -> Bool {
        return self == ")" ? true : false
    }
    
    func isOperation() -> Bool {
        return self == "+" || self == "-" || self == "×" || self == "÷"
    }
    
    func numberOfOpenParentheses() -> Int {
        return self.filter { $0 == "(" }.count
    }
    
    func numberOfCloseParentheses() -> Int {
        return self.filter { $0 == ")" }.count
    }
}
