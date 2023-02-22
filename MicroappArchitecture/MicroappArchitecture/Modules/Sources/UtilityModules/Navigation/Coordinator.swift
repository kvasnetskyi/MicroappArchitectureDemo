//
//  Coordinator.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import UIKit
import Combine

public protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    
    func start()
}

// MARK: - 
public extension Coordinator {
    func push(_ viewController: UIViewController, animated: Bool = true) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool = true) {
        navigationController.popToRootViewController(animated: animated)
    }
}
