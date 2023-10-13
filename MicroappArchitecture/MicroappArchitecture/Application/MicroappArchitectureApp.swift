//
//  MicroappArchitectureApp.swift
//  MicroappArchitecture
//
//  Created by Artem Kvasnetskyi on 10.10.2022.
//

import SwiftUI

@main
struct MicroappArchitectureApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(viewModel: .init())
        }
    }
}
