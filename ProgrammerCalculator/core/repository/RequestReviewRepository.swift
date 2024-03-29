//
//  RequestReview.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 29/03/24.
//

import Foundation

protocol RequestReviewRepository {
    
    func updateAlreadyRequested(value: Bool)
    
    func updateNumberOfInteractions(value: Int)
    
    func hasBeenRequested() -> Bool
    
    func getNumberOfInteractions() -> Int
}
