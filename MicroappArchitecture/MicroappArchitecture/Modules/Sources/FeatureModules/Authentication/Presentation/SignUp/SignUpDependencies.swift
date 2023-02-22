//
//  SignUpDependencies.swift
//  
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import Foundation
import Combine
import Entities

public struct SignUpDependencies {
    // MARK: - Internal Properties
    var registration: (_ email: String, _ password: String) -> AnyPublisher<UserAuthData, NetworkError>
    var saveAction: (UserAuthData) -> Void
    
    // MARK: - Init
    public init(
        registration: @escaping (String, String) -> AnyPublisher<UserAuthData, NetworkError>,
        saveAction: @escaping (UserAuthData) -> Void
    ) {
        self.registration = registration
        self.saveAction = saveAction
    }
}

// MARK: - Placeholder
extension SignUpDependencies {
    static let placeholder = SignUpDependencies(
        registration: { _ ,_  in
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
