//
//  RootView.swift
//  MicroappArchitecture
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import SwiftUI
import Authentication
import Home

struct RootView: View {
    // MARK: - Internal Properties
    @StateObject var viewModel: RootViewModel
    
    // MARK: - Body
    var body: some View {
        switch viewModel.currentFeature {
        case .auth:
            AuthRoot(
                factory: .init(
                    viewModel.dependencies.authDependencies
                ),
                signInPassed: viewModel.currentFeature = .home,
                signUpPassed: viewModel.currentFeature = .home
            )
            
        case .home:
            HomeRoot(
                factory: .init(
                    viewModel.dependencies.homeDependencies
                )
            )
        }
    }
}
