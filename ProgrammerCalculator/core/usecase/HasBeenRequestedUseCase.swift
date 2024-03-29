//
//  hasBeenRequested.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 29/03/24.
//

import Foundation

struct HasBeenRequestedUseCase {
    
    private let requestReviewRepository: RequestReviewRepository
    
    init(requestReviewRepository: RequestReviewRepository) {
        self.requestReviewRepository = requestReviewRepository
    }
    
    func execute() -> Bool {
        return requestReviewRepository.hasBeenRequested()
    }
}
