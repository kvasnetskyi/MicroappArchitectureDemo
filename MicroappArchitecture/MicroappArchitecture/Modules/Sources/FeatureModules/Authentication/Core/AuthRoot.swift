//
//  AuthRoot.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import SwiftUI
import Navigation

public struct AuthRoot: View {
    // MARK: - Private Properties
    @StateObject private var navigation = NavigationStore<Route>()
    
    private let factory: AuthModuleFactory
    private let signInPassed: () -> Void
    private let signUpPassed: () -> Void
    
    // MARK: - Init
    public init(
        factory: AuthModuleFactory,
        signInPassed: @escaping @autoclosure () -> Void,
        signUpPassed: @escaping @autoclosure () -> Void
    ) {
        self.factory = factory
        self.signInPassed = signInPassed
        self.signUpPassed = signUpPassed
    }
    
    // MARK: - Body
    public var body: some View {
        NavigationStack(path: $navigation.route) {
            factory.getAuthSelect()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .signIn:
                        factory.getSignIn(
                            signInPassed: signInPassed()
                        )
                        
                    case .signUp:
                        factory.getSignUp(
                            signUpPassed: signUpPassed()
                        )
                    }
                }
        }
        .environmentObject(navigation)
    }
}

// MARK: - Preview Provider
struct AuthRoot_Previews: PreviewProvider {
    static var previews: some View {
        AuthRoot(
            factory: .init(
                .init(.placeholder, .placeholder)
            ),
            signInPassed: (),
            signUpPassed: ()
        )
    }
}
