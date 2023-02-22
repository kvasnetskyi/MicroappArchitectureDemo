//
//  AuthFeatureMicroapp.swift
//  AuthFeatureMicroapp
//
//  Created by Artem Kvasnetskyi on 27.01.2023.
//

import SwiftUI
import Authentication
import Entities
import Combine

@main
struct AuthFeatureMicroapp: App {
    var body: some Scene {
        WindowGroup {
            AuthRoot(
                factory: .init(
                    .init(
                        .init(
                            loginAction: { email, password in
                                debugPrint("Login: \(email), \(password)")
                                
                                return Just(DummyUserData())
                                    .setFailureType(to: NetworkError.self)
                                    .eraseToAnyPublisher()
                            },
                            saveAction: { _ in
                                debugPrint("Save user data")
                            }
                        ),
                        .init(
                            registration: { email, password in
                                debugPrint("Sign Up: \(email), \(password)")
                                
                                return Just(DummyUserData())
                                    .setFailureType(to: NetworkError.self)
                                    .eraseToAnyPublisher()
                            },
                            saveAction: { _ in
                                debugPrint("Save user data")
                            }
                        )
                    )
                ),
                signInPassed: (),
                signUpPassed: ()
            )
        }
    }
}

private struct DummyUserData: UserAuthData {
    let idToken: String = ""
    let refreshToken: String = ""
}
