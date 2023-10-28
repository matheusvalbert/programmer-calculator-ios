//
//  ContentView.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 20/03/22.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        ZStack {
            Colors.background
                .ignoresSafeArea()
            VStack {
                Result()
                BaseResult()
                Keyboard()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
