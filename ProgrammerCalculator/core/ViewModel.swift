//
//  CalculatorViewModel.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 26/10/23.
//

import Foundation

class ViewModel: ObservableObject {
    
    private let hasBeenRequestedUseCase: HasBeenRequestedUseCase
    private let updateNumberOfInteractionsUseCase: UpdateNumberOfInteractionsUseCase
    private let shouldRequestReviewUseCase: ShouldRequestReviewUseCase
    
    @Published var result = ResultState()
    
    init(
        hasBeenRequestedUseCase: HasBeenRequestedUseCase,
        updateNumberOfInteractionsUseCase: UpdateNumberOfInteractionsUseCase,
        shouldRequestReviewUseCase: ShouldRequestReviewUseCase
    ) {
        self.hasBeenRequestedUseCase = hasBeenRequestedUseCase
        self.updateNumberOfInteractionsUseCase = updateNumberOfInteractionsUseCase
        self.shouldRequestReviewUseCase = shouldRequestReviewUseCase
    }
    
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
    
    func shouldRequestReview() -> Bool {
        if(hasBeenRequestedUseCase.execute()) {
            return false
        }
        updateNumberOfInteractionsUseCase.execute()
        
        return shouldRequestReviewUseCase.execute()
    }
}
