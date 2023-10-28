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
        
        container.register(ViewModel.self) { resolver in
            
            return ViewModel()
        }
        .inObjectScope(.container)
    }
}
