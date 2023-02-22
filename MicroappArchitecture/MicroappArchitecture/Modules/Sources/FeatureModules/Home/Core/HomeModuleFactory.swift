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
    
    // MARK: - Init
    public init(_ dependencies: Dependencies) {
        self.dependencies = dependencies
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
