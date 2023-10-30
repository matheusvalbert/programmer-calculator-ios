//
//  Constants.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 20/03/22.
//

import SwiftUI
    
fileprivate let w = CGFloat(UIScreen.main.bounds.width)
fileprivate let h = CGFloat(UIScreen.main.bounds.height)

enum Fonts {
    public static let baseResult = Font.system(size: ResultSize.sizeResult, design: .default)
    public static let result = Font.system(size: ResultSize.size, design: .default)
}

enum ButtonSize {
    public static let width = (w/4) * 0.85
    public static let widthZero = width * 2 + 8
    public static let height = (h/7) * 0.55
    public static let cornerRadius: CGFloat = 12
}
enum ResultSize {
    public static let size = h * 0.1
    public static let sizeResult = h * 0.04
}

enum RectangleSize {
    public static let width: CGFloat = w/70
    public static let height: CGFloat = h/30
}
