//
//  SignInDependencies.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import Foundation
import Combine
import Entities

public struct SignInDependencies {
    // MARK: - Internal Properties
    var loginAction: (_ email: String, _ password: String) -> AnyPublisher<UserAuthData, NetworkError>
    var saveAction: (UserAuthData) -> Void
    
    // MARK: - Init
    public init(
        loginAction: @escaping (String, String) -> AnyPublisher<UserAuthData, NetworkError>,
        saveAction: @escaping (UserAuthData) -> Void
    ) {
        self.loginAction = loginAction
        self.saveAction = saveAction
    }
}

// MARK: - Placeholder
extension SignInDependencies {
    static let placeholder = SignInDependencies(
        loginAction: { _ ,_  in
            return Just(Dummy())
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
        },
        saveAction: { _ in }
    )
    
    fileprivate struct Dummy: UserAuthData {
        var idToken = String()
        var refreshToken = String()
    }
}
