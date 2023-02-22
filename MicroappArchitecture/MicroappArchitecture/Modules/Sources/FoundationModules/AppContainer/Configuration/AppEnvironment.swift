//
//  AppEnvironment.swift
//  
//
//  Created by Artem Kvasnetskyi on 28.12.2022.
//

import Foundation

public protocol AppEnvironment {
    var storageBaseURL: URL { get }
    var authBaseURL: URL { get }
    var tokenBaseURL: URL { get }
    var authAPIKey: String { get }
}
