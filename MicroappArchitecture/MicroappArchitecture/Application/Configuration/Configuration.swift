//
//  Configuration.swift
//  MicroappArchitecture
//
//  Created by Artem Kvasnetskyi on 12.10.2022.
//

import Foundation
import AppContainer

final class Configuration: AppConfiguration {
    let bundleId: String
    let environment: AppEnvironment
    
    init(bundle: Bundle) {
        guard let bundleId = bundle.bundleIdentifier,
              let infoDict = bundle.infoDictionary,
              let environmentValue = infoDict[Key.environment] as? String,
              let environment = Environment(rawValue: environmentValue) else {
            fatalError("Config file error")
        }
        
        self.bundleId = bundleId
        self.environment = environment
    }
}

// MARK: - Static Properties
private enum Key {
    static let environment: String = "APP_ENVIRONMENT"
}
