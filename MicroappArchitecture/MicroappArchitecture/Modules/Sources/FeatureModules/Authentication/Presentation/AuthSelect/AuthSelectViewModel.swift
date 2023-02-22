//
//  AuthSelectViewModel.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import Foundation
import Combine

protocol AuthSelectViewModel: ObservableObject {
    var transition: AnyPublisher<Transition, Never> { get }
    
    func signInTapped()
    func signUpTapped()
}

final class AuthSelectViewModelImpl: AuthSelectViewModel {
    // MARK: - Internal Properties
    lazy var transition = transitionSubject.eraseToAnyPublisher()
    
    // MARK: - Private Properties
    private let transitionSubject = PassthroughSubject<Transition, Never>()
}

// MARK: - Internal Methods
extension AuthSelectViewModelImpl {
    func signInTapped() {
        transitionSubject.send(
            .route(.signIn)
        )
    }
    
    func signUpTapped() {
        transitionSubject.send(
            .route(.signUp)
        )
    }
}
