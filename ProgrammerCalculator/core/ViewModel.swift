//
//  CalculatorViewModel.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 26/10/23.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var result = ResultState()
    
    func onChangeBase(event: BaseEvent) {
        ChangeBaseUseCase.execute(result: &result, event: event)
    }
    
    func baseIsSelected(base: BaseEvent) -> Bool {
        return result.base == base ? true : false
    }
    
    func onInputEvent(event: InputEvent) {
        switch event {
        case .digit(let digit):
            NewDigitToExpressionUseCase.execute(result: &result, digit: digit)
        case .operation(let operation):
            NewOperationToExpressionUseCase.execute(result: &result, operation: operation)
        case .clear:
            ClearUseCase.execute(result: &result)
        case .openParentheses:
            OpenParenthesesUseCase.execute(result: &result)
        case .closeParentheses:
            CloseParenthesesUseCase.execute(result: &result)
        case .shl:
            ShiftLeftUseCase.execute(result: &result)
        case .shr:
            ShiftRightUseCase.execute(result: &result)
        case .delete:
            DeleteUseCase.execute(result: &result)
        case .equal:
            EqualUseCase.execute(result: &result)
        }
        
        CalculateUseCase.execute(result: &result)
    }
}
