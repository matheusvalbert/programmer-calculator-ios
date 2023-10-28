//
//  Result.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 22/03/22.
//

import SwiftUI

struct Result: View {
    
    @ObservedObject var viewModel: ViewModel = DIContainer.shared.resolve()
    
    var body: some View {
        HStack {
            Spacer()
            CustomText(text: viewModel.result.input, height: ResultSize.size, font: Fonts.result, color: Colors.text)
        }
    }
}

struct Result_Preview: PreviewProvider {
    static var previews: some View {
        Result()
    }
}
