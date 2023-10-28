//
//  CalculateUseCase.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 27/10/23.
//

import Foundation

struct CalculateUseCase {
    static func execute(result: inout ResultState) {
        do {
            let convertedExpression = try Converter.convert(expression: result.input, base: result.base)
            let expression = NSExpression(format: convertedExpression)
            if let evaluatedExpression = expression.expressionValue(with: nil, context: nil) as? Int {
                try checkOverflow(evaluatedExpression: evaluatedExpression)
                result.generateResults(result: evaluatedExpression)
            } else {
                throw NSError(domain: "com.matheusvalbert.programmercalculator", code: 1)
            }
        } catch {
            result.generateOverflow()
        }
    }
    
    static private func checkOverflow(evaluatedExpression: Int) throws {
        if String(evaluatedExpression).count > 14 {
            throw NSError(domain: "com.matheusvalbert.programmercalculator", code: 1)
        }
    }
}
