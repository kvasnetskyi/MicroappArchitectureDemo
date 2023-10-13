//
//  HomeRoot.swift
//  
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import SwiftUI
import Navigation

public struct HomeRoot: View {
    // MARK: - Private Properties
    private let coordinator: Coordinator
    
    // MARK: - Init
    public init(dependencies: HomeModuleFactory.Dependencies) {
        let coordinator = HomeCoordinator(.init())
        let factory = HomeModuleFactory(dependencies, coordinator)
        coordinator.factory = factory
        
        self.coordinator = coordinator
    }
    
    // MARK: - Body
    public var body: some View {
        CoordinatorRepresentable(coordinator)
    }
}
