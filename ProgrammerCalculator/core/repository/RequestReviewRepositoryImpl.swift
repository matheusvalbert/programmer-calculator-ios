//
//  RequestReviewRepository.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 29/03/24.
//

import Foundation

class RequestReviewRepositoryImpl: RequestReviewRepository {
    
    func updateAlreadyRequested(value: Bool) {
        UserDefaultsHelper.update(value: value)
    }
    
    func updateNumberOfInteractions(value: Int) {
        UserDefaultsHelper.update(value: value)
    }
    
    func hasBeenRequested() -> Bool {
        return UserDefaultsHelper.get()
    }
    
    func getNumberOfInteractions() -> Int {
        return UserDefaultsHelper.get()
    }
}
