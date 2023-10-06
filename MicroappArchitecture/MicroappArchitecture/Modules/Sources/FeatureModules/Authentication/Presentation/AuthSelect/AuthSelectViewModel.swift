//
//  AuthSelectViewModel.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import Foundation
import Navigation

protocol AuthSelectViewModel: ObservableObject {
    func signInTapped()
    func signUpTapped()
}

final class AuthSelectViewModelImpl: AuthSelectViewModel {
    // MARK: - Private Properties
    private let navigation: NavigationStore<Route>
    
    // MARK: - Init
    init(navigation: NavigationStore<Route>) {
        self.navigation = navigation
    }
}

// MARK: - Internal Methods
extension AuthSelectViewModelImpl {
    func signInTapped() {
        navigation.push(.signIn)
    }
    
    func signUpTapped() {
        navigation.push(.signUp)
    }
}

// MARK: - Placeholder
extension AuthSelectViewModelImpl {
    static let placeholder = AuthSelectViewModelImpl(navigation: .init())
}
