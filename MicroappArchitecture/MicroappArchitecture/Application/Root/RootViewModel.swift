//
//  RootViewModel.swift
//  MicroappArchitecture
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import Foundation

final class RootViewModel: ObservableObject {
    // MARK: - Internal Properties
    @Published var currentFeature: Feature
    
    let dependencies: Dependencies
    
    // MARK: - Init
    init(
        dependencies: Dependencies,
        currentFeature: Feature = .auth
    ) {
        self.dependencies = dependencies
        self.currentFeature = currentFeature
    }
}

// MARK: - Models
extension RootViewModel {
    enum Feature {
        case auth
        case home
    }
}
