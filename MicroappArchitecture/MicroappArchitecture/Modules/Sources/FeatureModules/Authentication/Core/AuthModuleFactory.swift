//
//  AuthModuleFactory.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import Foundation
import SwiftUI

public final class AuthModuleFactory {
    // MARK: - Dependencies
    public struct Dependencies {
        let signInDependencies: SignInDependencies
        let signUpDependencies: SignUpDependencies
        
        public init(
            _ signIn: SignInDependencies,
            _ signUp: SignUpDependencies
        ) {
            signInDependencies = signIn
            signUpDependencies = signUp
        }
    }
    
    // MARK: - Private Properties
    private let dependencies: Dependencies
    
    // MARK: - Init
    public init(_ dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - Internal Methods
extension AuthModuleFactory {
    @ViewBuilder
    func getAuthSelect() -> some View {
        AuthSelectView(
            viewModel: AuthSelectViewModelImpl()
        )
    }
    
    @ViewBuilder
    func getSignIn(
        signInPassed: @escaping @autoclosure () -> Void
    ) -> some View {
        SignInView(
            viewModel: SignInViewModelImpl(
                SignInModelImpl(
                    dependencies: self.dependencies.signInDependencies
                ),
                signInPassed: signInPassed()
            )
        )
    }
    
    @ViewBuilder
    func getSignUp(
        signUpPassed: @escaping @autoclosure () -> Void
    ) -> some View {
        SignUpView(
            viewModel: SignUpViewModelImpl(
                SignUpModelImpl(
                    dependencies: self.dependencies.signUpDependencies
                ),
                signUpPassed: signUpPassed()
            )
        )
    }
}
