//
//  DIContainer.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 26/10/23.
//

import Swinject

struct DIContainer {
    
    static let shared = DIContainer()

    let container: Container = Container()
    let assembler: Assembler

    init() {
        assembler = Assembler([
            AppAssembly()
        ], container: container)
    }

    func resolve<T>() -> T {
        guard let resolvedType = container.resolve(T.self) else {
            fatalError()
        }
        return resolvedType
    }
}
