//
//  AppButtonStyle.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import SwiftUI
import Resources

public struct AppButtonStyle: ButtonStyle {
    // MARK: - Internal Properties
    @Environment(\.isEnabled) var isEnabled
    
    // MARK: - Private Properties
    let fontSize: CGFloat
    
    // MARK: - Init
    public init(fontSize: CGFloat = 16) {
        self.fontSize = fontSize
    }
    
    // MARK: - Body
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(
                FontFamily.Montserrat.medium.swiftUIFont(
                    fixedSize: fontSize
                )
            )
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(
                isEnabled ? Colors.neutral100.swiftUIColor : Colors.neutral80.swiftUIColor
            )
            .background {
                Capsule()
                    .fill(
                        isEnabled ? Colors.neutral15.swiftUIColor : Colors.neutral30.swiftUIColor
                    )
            }
    }
}
