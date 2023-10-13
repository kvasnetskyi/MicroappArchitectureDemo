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
    let storageBaseURL: URL
    let authBaseURL: URL
    let tokenBaseURL: URL
    let authAPIKey: String
    
    init(bundle: Bundle) {
        guard let bundleId = bundle.bundleIdentifier,
              let infoDict = bundle.infoDictionary,
              let environmentValue = infoDict[Key.environment] as? String,
              let environment = AppEnvironment(rawValue: environmentValue),
              let rawStorageBaseURL = infoDict[Key.storageBaseURL] as? String,
              let rawAuthBaseURL = infoDict[Key.authBaseURL] as? String,
              let rawTokenBaseURL = infoDict[Key.tokenBaseURL] as? String,
              let authAPIKey = infoDict[Key.authAPIKey] as? String,
              let storageBaseURL = URL(string: rawStorageBaseURL),
              let authBaseURL = URL(string: rawAuthBaseURL),
              let tokenBaseURL = URL(string: rawTokenBaseURL) else {
            fatalError("Config file error")
        }
        
        self.bundleId = bundleId
        self.environment = environment
        self.storageBaseURL = storageBaseURL
        self.authBaseURL = authBaseURL
        self.tokenBaseURL = tokenBaseURL
        self.authAPIKey = authAPIKey
    }
}

// MARK: - Static Properties
private enum Key {
    static let environment = "APP_ENVIRONMENT"
    static let storageBaseURL = "STORAGE_BASE_URL"
    static let authBaseURL = "AUTH_BASE_URL"
    static let tokenBaseURL = "TOKEN_BASE_URL"
    static let authAPIKey = "AUTH_API_KEY"
}
