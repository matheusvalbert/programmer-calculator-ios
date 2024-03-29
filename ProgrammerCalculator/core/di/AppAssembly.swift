//
//  AppAssembly.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 26/10/23.
//

import Foundation
import Swinject

struct AppAssembly: Assembly {
    
    func assemble(container: Swinject.Container) {
        
        container.register(RequestReviewRepository.self) { resolver in
            
            return RequestReviewRepositoryImpl()
        }
        
        container.register(HasBeenRequestedUseCase.self) { resolver in
            
            guard let requestReviewRepository = resolver.resolve(RequestReviewRepository.self) else {
                fatalError("request review repository dependency could no be resolved")
            }
            
            return HasBeenRequestedUseCase(requestReviewRepository: requestReviewRepository)
        }
        
        container.register(UpdateNumberOfInteractionsUseCase.self) { resolver in
            
            guard let requestReviewRepository = resolver.resolve(RequestReviewRepository.self) else {
                fatalError("request review repository dependency could no be resolved")
            }
            
            return UpdateNumberOfInteractionsUseCase(requestReviewRepository: requestReviewRepository)
        }
        
        container.register(ShouldRequestReviewUseCase.self) { resolver in
            
            guard let requestReviewRepository = resolver.resolve(RequestReviewRepository.self) else {
                fatalError("request review repository dependency could no be resolved")
            }
            
            return ShouldRequestReviewUseCase(requestReviewRepository: requestReviewRepository)
        }
        
        container.register(ViewModel.self) { resolver in
            
            guard let hasBeenRequestedUseCase = resolver.resolve(HasBeenRequestedUseCase.self) else {
                fatalError("has been requested use case dependency could no be resolved")
            }
            
            guard let updateNumberOfInteractionsUseCase = resolver.resolve(UpdateNumberOfInteractionsUseCase.self) else {
                fatalError("update number of interactions use case dependency could no be resolved")
            }
            
            guard let shouldRequestReviewUseCase = resolver.resolve(ShouldRequestReviewUseCase.self) else {
                fatalError("should request review use case dependency could no be resolved")
            }
            
            return ViewModel(
                hasBeenRequestedUseCase: hasBeenRequestedUseCase,
                updateNumberOfInteractionsUseCase: updateNumberOfInteractionsUseCase,
                shouldRequestReviewUseCase: shouldRequestReviewUseCase
            )
        }
        .inObjectScope(.container)
    }
}
