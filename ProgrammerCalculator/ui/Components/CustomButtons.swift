//
//  Buttons.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 20/03/22.
//

import SwiftUI

struct CalculatorButton: View {
    let text: String
    let height: CGFloat = ButtonSize.height
    var width: CGFloat = ButtonSize.width
    var backgroundColor = Color(.button)
    var disabledBackgroundColor = Color(.disabledButton)
    var textColor: Color = Color(.text)
    var disabledTextColor = Color(.disabledText)
    var enabled = true
    let onTap: () -> Void

    var body: some View {
        Button(action: {
            onTap()
        }) {
            Text(text)
                .font(.title)
                .frame(width: width, height: height)
                .background(enabled ? backgroundColor : disabledBackgroundColor)
                .foregroundColor(textColor)
                .cornerRadius(ButtonSize.cornerRadius)
        }
        .disabled(!enabled)
    }
}

struct BaseButton: View {
    let base: String
    let result: String
    let selected: Bool
    let onTap: () -> Void
    
    var body: some View {
        HStack {
            Button(action: {
                onTap()
            }) {
                SelectedBase(selected: selected)
                CustomText(text: base, height: ResultSize.sizeResult, font: Fonts.baseResult, color: Color(.textResult))
                CustomText(text: result, height: ResultSize.sizeResult, font: Fonts.baseResult, color: Color(.text))
                Spacer()
            }
        }
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CalculatorButton(text: "X") {
                
            }
            BaseButton(base: "H E X", result: "10", selected: true) {
                
            }
        }
        .previewLayout(.sizeThatFits)
    }
}
