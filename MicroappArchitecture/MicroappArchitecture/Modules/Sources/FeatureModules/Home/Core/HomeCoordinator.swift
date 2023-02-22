//
//  HomeCoordinator.swift
//  
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import Navigation
import UIKit

final class HomeCoordinator: Coordinator {
    // MARK: - Internal Properties
    var navigationController: UINavigationController
    
    // MARK: - Private Properties
    private let factory: HomeModuleFactory
    
    // MARK: - Init
    init(
        _ navigationController: UINavigationController,
        _ factory: HomeModuleFactory
    ) {
        self.navigationController = navigationController
        self.factory = factory
    }
}

// MARK: - Internal Properties
extension HomeCoordinator {
    func start() {
        let vc = factory.getHome()
        navigationController.setViewControllers([vc], animated: false)
    }
}
