//
//  AppConfiguration.swift
//  
//
//  Created by Artem Kvasnetskyi on 28.12.2022.
//

import Foundation

public enum AppEnvironment: String {
    case development
    case staging
    case production
}

public protocol AppConfiguration {
    var bundleId: String { get }
    var environment: AppEnvironment { get }
    var storageBaseURL: URL { get }
    var authBaseURL: URL { get }
    var tokenBaseURL: URL { get }
    var authAPIKey: String { get }
}
