//
//  Keyboard.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 21/03/22.
//

import SwiftUI

struct Keyboard: View {
    var body: some View {
        VStack {
            LineZero()
            LineOne()
            LineTwo()
            LineThree()
            LineFour()
            LineFive()
            LineSix()
        }
    }
}

struct LineZero: View {
    
    @Injected var viewModel: ViewModel
    
    var body: some View {
        HStack {
            CalculatorButton(
                text: "C",
                backgroundColor: Color(.functionButton),
                textColor: Color(.operationButtonText)
            ) {
                viewModel.onInputEvent(event: .clear)
                requestReviewIfNeeded()
            }
            CalculatorButton(
                text: "(",
                backgroundColor: Color(.functionButton),
                textColor: Color(.operationButtonText)
            ) {
                viewModel.onInputEvent(event: .openParentheses)
            }
            CalculatorButton(
                text: ")",
                backgroundColor: Color(.functionButton),
                textColor: Color(.operationButtonText)
            ) {
                viewModel.onInputEvent(event: .closeParentheses)
            }
            CalculatorButton(
                text: "<<",
                backgroundColor: Color(.functionButton),
                textColor: Color(.operationButtonText),
                enabled: viewModel.result.base == .bin
            ) {
                viewModel.onInputEvent(event: .shl)
            }
        }
    }
}

struct LineOne: View {
    
    @Injected var viewModel: ViewModel
    
    var body: some View {
        HStack {
            CalculatorButton(
                text: "D",
                enabled: viewModel.result.base == .hex
            ) {
                viewModel.onInputEvent(event: .digit("D"))
            }
            CalculatorButton(
                text: "E",
                enabled: viewModel.result.base == .hex
            ) {
                viewModel.onInputEvent(event: .digit("E"))
            }
            CalculatorButton(
                text: "F",
                enabled: viewModel.result.base == .hex
            ) {
                viewModel.onInputEvent(event: .digit("F"))
            }
            CalculatorButton(
                text: ">>",
                backgroundColor: Color(.functionButton),
                textColor: Color(.operationButtonText),
                enabled: viewModel.result.base == .bin
            ) {
                viewModel.onInputEvent(event: .shr)
            }
        }
    }
}

struct LineTwo: View {
    
    @Injected var viewModel: ViewModel
    
    var body: some View {
        HStack {
            CalculatorButton(
                text: "A",
                enabled: viewModel.result.base == .hex
            ) {
                viewModel.onInputEvent(event: .digit("A"))
            }
            CalculatorButton(
                text: "B",
                enabled: viewModel.result.base == .hex
            ) {
                viewModel.onInputEvent(event: .digit("B"))
            }
            CalculatorButton(
                text: "C",
                enabled: viewModel.result.base == .hex
            ) {
                viewModel.onInputEvent(event: .digit("C"))
            }
            CalculatorButton(
                text: "÷",
                backgroundColor: Color(.functionButton),
                textColor: Color(.operationButtonText)
            ) {
                viewModel.onInputEvent(event: .operation("÷"))
            }
        }
    }
}

struct LineThree: View {
    
    @Injected var viewModel: ViewModel
    
    var body: some View {
        HStack {
            CalculatorButton(
                text: "7",
                enabled: viewModel.result.base != .bin
            ) {
                viewModel.onInputEvent(event: .digit("7"))
            }
            CalculatorButton(
                text: "8",
                enabled: viewModel.result.base == .hex || viewModel.result.base == .dec
            ) {
                viewModel.onInputEvent(event: .digit("8"))
            }
            CalculatorButton(
                text: "9",
                enabled: viewModel.result.base == .hex || viewModel.result.base == .dec
            ) {
                viewModel.onInputEvent(event: .digit("9"))
            }
            CalculatorButton(
                text: "×",
                backgroundColor: Color(.operationButton),
                textColor: Color(.operationButtonText)
            ) {
                viewModel.onInputEvent(event: .operation("×"))
            }
        }
    }
}

struct LineFour: View {
    
    @Injected var viewModel: ViewModel
    
    var body: some View {
        HStack {
            CalculatorButton(
                text: "4",
                enabled: viewModel.result.base != .bin
            ) {
                viewModel.onInputEvent(event: .digit("4"))
            }
            CalculatorButton(
                text: "5",
                enabled: viewModel.result.base != .bin
            ) {
                viewModel.onInputEvent(event: .digit("5"))
            }
            CalculatorButton(
                text: "6",
                enabled: viewModel.result.base != .bin
            ) {
                viewModel.onInputEvent(event: .digit("6"))
            }
            CalculatorButton(
                text: "-",
                backgroundColor: Color(.operationButton),
                textColor: Color(.operationButtonText)
            ) {
                viewModel.onInputEvent(event: .operation("-"))
            }
        }
    }
}

struct LineFive: View {
    
    @Injected var viewModel: ViewModel
    
    var body: some View {
        HStack {
            CalculatorButton(text: "1") {
                viewModel.onInputEvent(event: .digit("1"))
            }
            CalculatorButton(
                text: "2",
                enabled: viewModel.result.base != .bin
            ) {
                viewModel.onInputEvent(event: .digit("2"))
            }
            CalculatorButton(
                text: "3",
                enabled: viewModel.result.base != .bin
            ) {
                viewModel.onInputEvent(event: .digit("3"))
            }
            CalculatorButton(
                text: "+",
                backgroundColor: Color(.operationButton),
                textColor: Color(.operationButtonText)
            ) {
                viewModel.onInputEvent(event: .operation("+"))
            }
        }
    }
}

struct LineSix: View {
    
    @Injected var viewModel: ViewModel
    
    var body: some View {
        HStack {
            CalculatorButton(
                text: "0",
                width: ButtonSize.widthZero
            ) {
                viewModel.onInputEvent(event: .digit("0"))
            }
            CalculatorButton(text: "⌫") {
                viewModel.onInputEvent(event: .delete)
            }
            CalculatorButton(
                text: "=",
                backgroundColor: Color(.operationButton),
                textColor: Color(.operationButtonText)
            ) {
                viewModel.onInputEvent(event: .equal)
                requestReviewIfNeeded()
            }
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard()
    }
}
