//
//  SignUpViewModel.swift
//  
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import Foundation
import Combine
import Base

protocol SignUpViewModel: ViewModel {
    var email: String { get set }
    var password: String { get set }
    var confirmPassword: String { get set }
    var isSignUpActive: Bool { get }
    
    func signUpTapped()
}

final class SignUpViewModelImpl: BaseViewModel, SignUpViewModel {
    // MARK: - Internal Properties
    @Published var email = String()
    @Published var password = String()
    @Published var confirmPassword = String()
    @Published var isSignUpActive = false
    
    // MARK: - Private Properties
    private let model: SignUpModel
    private let signUpPassed: () -> Void
    
    // MARK: - Init
    init(
        _ model: SignUpModel,
        signUpPassed: @escaping @autoclosure () -> Void
    ) {
        self.model = model
        self.signUpPassed = signUpPassed
        
        super.init()
        
        binding()
    }
}

// MARK: - Internal Methods
extension SignUpViewModelImpl {
    func signUpTapped() {
        renderingState.render(.loading)
        
        model.signUp(email: email, password: password)
            .sink { [weak self] completion in
                guard case let .failure(error) = completion else {
                    self?.renderingState.render(.view)
                    self?.signUpPassed()
                    return
                }
                
                self?.renderingState.render(.error(error))
                
            } receiveValue: { _ in }
            .store(in: &subscriptions)
    }
}

// MARK: - Private Methods
private extension SignUpViewModelImpl {
    func binding() {
        $email
            .combineLatest($password, $confirmPassword)
            .sink { [weak self] email, password, confirmPassword in
                let isEmailValid = email.count > 5
                let isPasswordValid = password.count > 5 && password == confirmPassword
                
                self?.isSignUpActive = isEmailValid && isPasswordValid
            }
            .store(in: &subscriptions)
    }
}

// MARK: - Preview
extension SignUpViewModelImpl {
    static let placeholder = SignUpViewModelImpl(
        SignUpModelImpl(dependencies: .placeholder),
        signUpPassed: ()
    )
}
