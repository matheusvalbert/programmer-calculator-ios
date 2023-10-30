//
//  Injected.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 30/10/23.
//

import Foundation
import SwiftUI

@propertyWrapper
struct Injected<T: ObservableObject>: DynamicProperty {
    
    @ObservedObject var wrappedValue: T
    
    init() {
        self.wrappedValue = DIContainer.shared.resolve()
    }
}
