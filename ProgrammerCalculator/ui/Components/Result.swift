//
//  Result.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 22/03/22.
//

import SwiftUI

struct Result: View {
    
    @Injected var viewModel: ViewModel
    
    var body: some View {
        HStack {
            Spacer()
            CustomText(text: viewModel.result.input, height: ResultSize.size, font: Fonts.result, color: Color(.text))
        }
    }
}

struct Result_Preview: PreviewProvider {
    static var previews: some View {
        Result()
    }
}
