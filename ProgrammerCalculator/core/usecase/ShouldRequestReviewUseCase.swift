//
//  ShouldRequestReviewUseCase.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 29/03/24.
//

import Foundation

struct ShouldRequestReviewUseCase {
    
    private let requestReviewRepository: RequestReviewRepository
    
    init(requestReviewRepository: RequestReviewRepository) {
        self.requestReviewRepository = requestReviewRepository
    }
    
    func execute() -> Bool {
        let numberOfInteractions = requestReviewRepository.getNumberOfInteractions()
        
        if(numberOfInteractions == 15) {
            requestReviewRepository.updateAlreadyRequested(value: true)
            return true
        }
        
        return false
    }
}
