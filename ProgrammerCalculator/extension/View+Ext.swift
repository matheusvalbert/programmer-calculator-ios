//
//  View+Ext.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 29/03/24.
//

import SwiftUI
import StoreKit

extension View {
    @MainActor 
    func requestReviewIfNeeded() {
        let viewModel: ViewModel = DIContainer.shared.resolve()
        
        if(viewModel.shouldRequestReview()) {
            guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
                return
            }
            SKStoreReviewController.requestReview(in: scene)
        }
    }
}
