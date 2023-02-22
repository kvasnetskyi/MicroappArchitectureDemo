//
//  HomeFeatureMicroAppApp.swift
//  HomeFeatureMicroApp
//
//  Created by Artem Kvasnetskyi on 27.01.2023.
//

import SwiftUI
import Home
import Combine
import Entities

@main
struct HomeFeatureMicroApp: App {
    var body: some Scene {
        WindowGroup {
            HomeRoot(
                factory: .init(
                    .init(
                        .init(
                            loadCharactersAction: {
                                print("Load Characters")
                                
                                return Just(C.dummyCharacters)
                                    .setFailureType(to: NetworkError.self)
                                    .eraseToAnyPublisher()
                            }
                        )
                    )
                )
            )
        }
    }
}

private enum C {
    static let dummyCharacters: [CharacterData] = [
        .placeholder,
        .placeholder,
        .placeholder
    ]
}
