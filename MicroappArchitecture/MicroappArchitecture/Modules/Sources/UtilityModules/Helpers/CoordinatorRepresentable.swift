//
//  CoordinatorRepresentable.swift
//  
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import UIKit
import Navigation
import SwiftUI

public struct CoordinatorRepresentable: UIViewControllerRepresentable {
    // MARK: - Private Properties
    private let coordinator: Coordinator
    
    // MARK: - Init
    public init(_ coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Public Methods
    public func makeUIViewController(context: Context) -> UINavigationController {
        coordinator.start()
        
        return coordinator.navigationController
    }
    
    public func updateUIViewController(
        _ uiViewController: UINavigationController,
        context: Context
    ) {}
}
