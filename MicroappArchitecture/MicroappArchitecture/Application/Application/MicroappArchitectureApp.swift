//
//  MicroappArchitectureApp.swift
//  MicroappArchitecture
//
//  Created by Artem Kvasnetskyi on 10.10.2022.
//

import SwiftUI

@main
struct MicroappArchitectureApp: App {
    // MARK: - Internal Properties
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    // MARK: Body
    var body: some Scene {
        WindowGroup {
            RootView(
                viewModel: .init(
                    dependencies: appDelegate.dependencies
                )
            )
        }
    }
}
