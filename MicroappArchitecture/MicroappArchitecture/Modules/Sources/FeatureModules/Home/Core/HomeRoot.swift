//
//  HomeRoot.swift
//  
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import SwiftUI
import Navigation
import Helpers

public struct HomeRoot: View {
    // MARK: - Private Properties
    private let coordinator: Coordinator
    
    // MARK: - Init
    public init(factory: HomeModuleFactory) {
        coordinator = HomeCoordinator(
            .init(),
            factory
        )
    }
    
    // MARK: - Body
    public var body: some View {
        CoordinatorRepresentable(coordinator)
    }
}
