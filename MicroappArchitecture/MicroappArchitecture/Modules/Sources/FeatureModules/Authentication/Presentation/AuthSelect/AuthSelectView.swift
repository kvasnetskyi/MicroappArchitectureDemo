//
//  SwiftUIView.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import SwiftUI
import Views

struct AuthSelectView<VM: AuthSelectViewModel>: View {
    // MARK: - Internal Properties
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
        .buttonStyle(
            AppButtonStyle()
        )
        
        Button(Localization.Sign.Up.title) {
            viewModel.signUpTapped()
        }
        .buttonStyle(
            AppButtonStyle()
        )
    }
}

// MARK: - Preview Provider
#Preview {
    AuthSelectView(viewModel: AuthSelectViewModelImpl.placeholder)
}
