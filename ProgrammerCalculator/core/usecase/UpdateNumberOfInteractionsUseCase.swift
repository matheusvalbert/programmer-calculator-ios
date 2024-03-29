//
//  UpdateNumberOfInteractions.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 29/03/24.
//

import Foundation

struct UpdateNumberOfInteractionsUseCase {
    
    private let requestReviewRepository: RequestReviewRepository
    
    init(requestReviewRepository: RequestReviewRepository) {
        self.requestReviewRepository = requestReviewRepository
    }
    
    func execute() {
        var numberOfInteractions = requestReviewRepository.getNumberOfInteractions()
        
        numberOfInteractions += 1
        
        requestReviewRepository.updateNumberOfInteractions(value: numberOfInteractions)
    }
}
