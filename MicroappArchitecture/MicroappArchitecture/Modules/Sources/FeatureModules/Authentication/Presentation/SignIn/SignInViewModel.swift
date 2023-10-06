//
//  SignInViewModel.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import Foundation
import Combine
import Base

protocol SignInViewModel: ViewModel {
    var email: String { get set }
    var password: String { get set }
    var isSignInActive: Bool { get }
    
    func signInTapped()
}

final class SignInViewModelImpl: BaseViewModel, SignInViewModel {
    // MARK: - Internal Properties
    @Published var email = String()
    @Published var password = String()
    @Published var isSignInActive = false
    
    // MARK: - Private Properties
    private let model: SignInModel
    private let signInPassed: () -> Void
    
    // MARK: - Init
    init(
        _ model: SignInModel,
        signInPassed: @escaping @autoclosure () -> Void
    ) {
        self.model = model
        self.signInPassed = signInPassed
        
        super.init()
        
        binding()
    }
}

// MARK: - Internal Methods
extension SignInViewModelImpl {
    func signInTapped() {
        renderingState.render(.loading)
        
        model.login(email: email, password: password)
            .sink { [weak self] completion in
                guard case let .failure(error) = completion else {
                    self?.renderingState.render(.view)
                    self?.signInPassed()
                    return
                }
                
                self?.renderingState.render(.error(error))
                
            } receiveValue: { _ in }
            .store(in: &subscriptions)
    }
}

// MARK: - Private Methods
private extension SignInViewModelImpl {
    func binding() {
        $email.combineLatest($password)
            .sink { [weak self] email, password in
                let isEmailValid = email.count > 5
                let isPasswordValid = password.count > 5
                
                self?.isSignInActive = isEmailValid && isPasswordValid
            }
            .store(in: &subscriptions)
    }
}

// MARK: - Preview
extension SignInViewModelImpl {
    static let placeholder = SignInViewModelImpl(
        SignInModelImpl(dependencies: .placeholder),
        signInPassed: ()
    )
}
