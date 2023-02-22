//
//  ViewRepresentable.swift
//  
//
//  Created by Artem Kvasnetskyi on 28.12.2022.
//

import SwiftUI
import UIKit

public struct ViewRepresentable<View: UIView>: UIViewRepresentable {
    public let view: View
    
    public init(
        _ view: View,
        setup: (View) -> Void = { _ in }
    ) {
        self.view = view
        setup(view)
    }
    
    public func makeUIView(context: Context) -> View { view }
    public func updateUIView(_ uiView: View, context: Context) {}
}
