//
//  BaseResult.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 22/03/22.
//

import SwiftUI

struct BaseResult: View {
    
    @Injected var viewModel: ViewModel
    
    var body: some View {
        VStack {
            BaseButton(base: "H E X", result: viewModel.result.hex, selected: viewModel.baseIsSelected(base: .hex)) {
                viewModel.onChangeBase(event: .hex)
            }
            BaseButton(base: "D E C", result: viewModel.result.dec, selected: viewModel.baseIsSelected(base: .dec)) {
                viewModel.onChangeBase(event: .dec)
            }
            BaseButton(base: "O C T", result: viewModel.result.oct, selected: viewModel.baseIsSelected(base: .oct)) {
                viewModel.onChangeBase(event: .oct)
            }
            BaseButton(base: "B  I  N", result: viewModel.result.bin, selected: viewModel.baseIsSelected(base: .bin)) {
                viewModel.onChangeBase(event: .bin)
            }
        }
    }
}

struct BaseResult_Preview: PreviewProvider {
    static var previews: some View {
        BaseResult()
    }
}
