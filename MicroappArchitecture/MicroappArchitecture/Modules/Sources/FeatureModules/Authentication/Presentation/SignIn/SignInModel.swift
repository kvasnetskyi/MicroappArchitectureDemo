//
//  SignInModel.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import Foundation
import Combine
import Entities

protocol SignInModel {
    func login(email: String, password: String) -> AnyPublisher<Never, NetworkError>
}

final class SignInModelImpl {
    // MARK: - Private Properties
    private let dependencies: SignInDependencies
    
    // MARK: - Init
    init(dependencies: SignInDependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - SignInModel
extension SignInModelImpl: SignInModel {
    func login(email: String, password: String) -> AnyPublisher<Never, NetworkError> {
        dependencies.loginAction(email, password)
            .receive(on: DispatchQueue.main)
            .map { [weak self] (data) -> Void in
                self?.dependencies.saveAction(data)
            }
            .ignoreOutput()
            .eraseToAnyPublisher()
    }
}
