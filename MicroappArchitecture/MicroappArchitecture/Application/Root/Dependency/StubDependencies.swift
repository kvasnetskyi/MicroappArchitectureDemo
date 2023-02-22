//
//  StubDependencies.swift
//  MicroappArchitecture
//
//  Created by Artem Kvasnetskyi on 15.02.2023.
//

import Foundation
import AppContainer
import Authentication
import Home
import Combine
import Entities

final class StubDependencies: Dependencies {
    // MARK: - Internal Properties
    lazy var authDependencies = AuthModuleFactory.Dependencies(
        .init(
            loginAction: { _, _ in
                StubDependencies.dummyUser
            },
            saveAction: { _ in }
        ),
        .init(
            registration: { _, _ in
                StubDependencies.dummyUser
            }, saveAction: { _ in }
        )
    )
    lazy var homeDependencies = HomeModuleFactory.Dependencies(
        .init(
            loadCharactersAction: { StubDependencies.dummyCharacters }
        )
    )
    
}
// MARK: - Private
private extension StubDependencies {
    static var dummyUser: AnyPublisher<UserAuthData, NetworkError> {
        Just(DummyUserData())
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
    
    static var dummyCharacters: AnyPublisher<[CharacterData], NetworkError> {
        Just([
            .placeholder,
            .placeholder,
            .placeholder
        ])
        .setFailureType(to: NetworkError.self)
        .eraseToAnyPublisher()
    }
    
    struct DummyUserData: UserAuthData {
        let idToken = String()
        let refreshToken = String()
        
    }
}
