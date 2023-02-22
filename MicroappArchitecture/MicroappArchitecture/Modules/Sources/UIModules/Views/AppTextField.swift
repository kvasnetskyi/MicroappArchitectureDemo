//
//  AppTextField.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import SwiftUI
import Resources

public struct AppTextField: View {
    // MARK: - Private Properties
    @Binding var text: String
    
    private let placeholder: String
    private let textSize: CGFloat
    
    // MARK: - Init
    public init(
        placeholder: String,
        textSize: CGFloat = 14,
        text: Binding<String>
    ) {
        self.placeholder = placeholder
        self.textSize = textSize
        self._text = text
    }
    
    // MARK: - Body
    public var body: some View {
        TextField(
            String(),
            text: $text,
            prompt: Text(placeholder)
                .font(
                    FontFamily.Montserrat.medium.swiftUIFont(fixedSize: textSize)
                )
                .foregroundColor(Colors.neutral100.swiftUIColor)
        )
        .font(
            FontFamily.Montserrat.medium.swiftUIFont(fixedSize: textSize)
        )
        .foregroundColor(Colors.neutral100.swiftUIColor)
        .tint(Colors.neutral100.swiftUIColor)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: C.cornerRadius)
                .fill(
                    Colors.neutral60.swiftUIColor
                )
        }
    }
}

// MARK: - Static Properties
private struct C {
    static let cornerRadius = 10.0
}
