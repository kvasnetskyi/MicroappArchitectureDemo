//
//  SwiftUIView.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import SwiftUI
import Navigation
import Views

struct AuthSelectView<VM: AuthSelectViewModel>: View {
    // MARK: - Internal Properties
    @EnvironmentObject var navigation: NavigationStore<Route>
    @StateObject var viewModel: VM
    
    // MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            image()
            Spacer()
            buttons()
        }
        .padding(.horizontal)
        .onReceive(viewModel.transition) { transition in
            switch transition {
            case .route(let route):
                navigation.push(route)
                
            case .pop: break
            }
        }
    }
}

// MARK: - Private Methods
private extension AuthSelectView {
    @ViewBuilder
    func image() -> some View {
        Assets.appImage.swiftUIImage
            .resizable()
            .scaledToFit()
    }
    
    @ViewBuilder
    func buttons() -> some View {
        Button(Localization.Sign.In.title) {
            viewModel.signInTapped()
        }
        .disabled(false)
        .buttonStyle(
            AppButtonStyle()
        )
        .accessibilityIdentifier(
            AuthUIIdentifiers.signInButton.rawValue
        )
        
        Button(Localization.Sign.Up.title) {
            viewModel.signUpTapped()
        }
        .buttonStyle(
            AppButtonStyle()
        )
        .accessibilityIdentifier(
            AuthUIIdentifiers.signUpButton.rawValue
        )
    }
}

// MARK: - Preview Provider
struct AuthSelectView_Previews: PreviewProvider {
    static var previews: some View {
        AuthSelectView(
            viewModel: AuthSelectViewModelImpl()
        )
    }
}
