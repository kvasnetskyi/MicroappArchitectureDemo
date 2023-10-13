//
//  Dependencies.swift
//  MicroappArchitecture
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import Foundation
import AppContainer
import Authentication
import Home

protocol Dependencies {
    var authDependencies: AuthModuleFactory.Dependencies { get }
    var homeDependencies: HomeModuleFactory.Dependencies { get }
}

final class DependenciesImpl: Dependencies {
    // MARK: - Private Propertes
    private let container: AppContainer
    
    // MARK: - Internal Properties
    lazy var authDependencies = AuthModuleFactory.Dependencies(
        .init(
            loginAction: container.authService.login(email:password:),
            saveAction: container.userService.save(_:)
        ),
        .init(
            registration: container.authService.registration(email:password:),
            saveAction: container.userService.save(_:)
        )
    )
    
    lazy var homeDependencies = HomeModuleFactory.Dependencies(
        .init(loadCharactersAction: container.characterService.getCharacters)
    )
    
    // MARK: - Init
    init() {
        let config = Configuration(bundle: .main)
        
        container = AppContainerImpl(config)
    }
}
