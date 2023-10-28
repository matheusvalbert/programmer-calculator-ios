//
//  TextViews.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 20/03/22.
//

import SwiftUI

struct CustomText: View {
    let text: String
    let height: CGFloat
    let font: Font
    let color: Color
    
    var body: some View {
        Text(text)
            .scaledToFit()
            .minimumScaleFactor(0.1)
            .lineLimit(1)
            .frame(height: height)
            .font(font)
            .foregroundColor(color)
    }
}

struct SelectedBase: View {
    var selected: Bool
    let color = Colors.operationButton
    
    var body: some View {
        Rectangle()
            .fill(selected == true ? color : color.opacity(0))
            .frame(width: RectangleSize.width, height: RectangleSize.height)
    }
}

struct CustomText_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomText(
                text: "test",
                height: 100,
                font: Font.system(size: ResultSize.size, design: .default),
                color: Color.black
            )
            SelectedBase(selected: true)
        }
        .previewLayout(.sizeThatFits)
    }
}
