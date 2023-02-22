//
//  SignUpView.swift
//  
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import SwiftUI
import Navigation
import Resources
import Views
import Base

struct SignUpView<VM: SignUpViewModel>: View {
    // MARK: - Internal Properties
    @EnvironmentObject var navigation: NavigationStore<Route>
    @StateObject var viewModel: VM
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: C.spacing) {
            textFields()
            
            Button(Localization.Sign.Up.title) {
                viewModel.signUpTapped()
            }
            .buttonStyle(AppButtonStyle())
            .disabled(!viewModel.isSignUpActive)
            .accessibilityIdentifier(
                AuthUIIdentifiers.signUpButton.rawValue
            )
            
            Spacer()
        }
        .navigationTitle(Localization.Sign.Up.title)
        .padding([.horizontal, .vertical])
        .subscribeToRenderingStates($viewModel)
    }
}

// MARK: - Private Methods
private extension SignUpView {
    @ViewBuilder
    func textFields() -> some View {
        VStack {
            AppTextField(
                placeholder: Localization.Credentials.Email.title,
                text: $viewModel.email
            )
            
            AppTextField(
                placeholder: Localization.Credentials.Password.title,
                text: $viewModel.password
            )
            
            AppTextField(
                placeholder: Localization.Credentials.Password.Confirm.title,
                text: $viewModel.confirmPassword
            )
        }
    }
}

// MARK: - Static Properties
private struct C {
    static let spacing = 40.0
}

// MARK: - Preview Provider
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(
            viewModel: SignUpViewModelImpl(
                SignUpModelImpl(dependencies: .placeholder),
                signUpPassed: ()
            )
        )
    }
}
