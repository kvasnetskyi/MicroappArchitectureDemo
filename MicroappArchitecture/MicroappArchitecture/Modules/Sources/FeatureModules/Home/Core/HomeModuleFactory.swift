//
//  HomeModuleFactory.swift
//  
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import Foundation
import UIKit

public final class HomeModuleFactory {
    // MARK: - Dependencies
    public struct Dependencies {
        let homeDependencies: HomeDependencies
        
        public init(
            _ home: HomeDependencies
        ) {
            homeDependencies = home
        }
    }
    
    // MARK: - Private Properties
    private let dependencies: Dependencies
    private weak var coordinator: HomeCoordinator?
    
    // MARK: - Init
    init(_ dependencies: Dependencies, _ coordinator: HomeCoordinator) {
        self.dependencies = dependencies
        self.coordinator = coordinator
    }
}

// MARK: - Internal Methods
extension HomeModuleFactory {
    func getHome() -> UIViewController {
        HomeViewController(
            viewModel: HomeViewModelImpl(
                HomeModelImpl(dependecies: dependencies.homeDependencies)
            )
        )
    }
}
