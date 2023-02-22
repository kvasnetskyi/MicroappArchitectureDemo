//
//  SignInView.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import SwiftUI
import Navigation
import Resources
import Views
import Base

struct SignInView<VM: SignInViewModel>: View {
    // MARK: - Internal Properties
    @EnvironmentObject var navigation: NavigationStore<Route>
    @StateObject var viewModel: VM
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: C.spacing) {
            textFields()
            
            Button(Localization.Sign.In.title) {
                viewModel.signInTapped()
            }
            .buttonStyle(AppButtonStyle())
            .disabled(!viewModel.isSignInActive)
            .accessibilityIdentifier(
                AuthUIIdentifiers.signInButton.rawValue
            )
            
            Spacer()
        }
        .navigationTitle(Localization.Sign.In.title)
        .padding([.horizontal, .vertical])
        .subscribeToRenderingStates($viewModel)
    }
}

// MARK: - Private Methods
private extension SignInView {
    @ViewBuilder
    func textFields() -> some View {
        VStack {
            AppTextField(
                placeholder: Localization.Credentials.Email.title,
                text: $viewModel.email
            )
            .accessibilityIdentifier(
                AuthUIIdentifiers.emailField.rawValue
            )
            
            AppTextField(
                placeholder: Localization.Credentials.Password.title,
                text: $viewModel.password
            )
            .accessibilityIdentifier(
                AuthUIIdentifiers.passwordField.rawValue
            )
        }
    }
}

// MARK: - Static Properties
private struct C {
    static let spacing = 40.0
}

// MARK: - Preview Provider
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(
            viewModel: SignInViewModelImpl(
                SignInModelImpl(dependencies: .placeholder),
                signInPassed: ()
            )
        )
    }
}
