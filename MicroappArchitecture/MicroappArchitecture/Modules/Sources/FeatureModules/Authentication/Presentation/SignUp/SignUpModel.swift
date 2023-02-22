//
//  SignUpModel.swift
//  
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import Foundation
import Combine
import Entities

protocol SignUpModel {
    func signUp(email: String, password: String) -> AnyPublisher<Never, NetworkError>
}

final class SignUpModelImpl {
    // MARK: - Private Properties
    private let dependencies: SignUpDependencies
    
    // MARK: - Init
    init(dependencies: SignUpDependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - SignUpModel
extension SignUpModelImpl: SignUpModel {
    func signUp(email: String, password: String) -> AnyPublisher<Never, NetworkError> {
        dependencies.registration(email, password)
            .receive(on: DispatchQueue.main)
            .map { [weak self] (data) -> Void in
                self?.dependencies.saveAction(data)
            }
            .ignoreOutput()
            .eraseToAnyPublisher()
    }
}
