//
//  AppDelegate.swift
//  MicroappArchitecture
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import Foundation
import UIKit

final class AppDelegate: NSObject, UIApplicationDelegate {
    let dependencies: Dependencies = {
        guard CommandLine.arguments.contains("–UITests") else {
            return DependenciesImpl()
        }
        
        return StubDependencies()
    }()
}
