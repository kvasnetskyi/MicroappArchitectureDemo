//
//  SignInView.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import SwiftUI
import Resources
import Views
import Base

struct SignInView<VM: SignInViewModel>: View {
    // MARK: - Internal Properties
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
            
            AppTextField(
                placeholder: Localization.Credentials.Password.title,
                text: $viewModel.password
            )
        }
    }
}

// MARK: - Static Properties
private struct C {
    static let spacing = 40.0
}

// MARK: - Preview Provider
#Preview {
    SignInView(viewModel: SignInViewModelImpl.placeholder)
}
