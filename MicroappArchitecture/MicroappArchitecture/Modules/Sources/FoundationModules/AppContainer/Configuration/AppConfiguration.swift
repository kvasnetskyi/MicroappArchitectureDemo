//
//  AppConfiguration.swift
//  
//
//  Created by Artem Kvasnetskyi on 28.12.2022.
//

import Foundation

public protocol AppConfiguration {
    var bundleId: String { get }
    var environment: AppEnvironment { get }
}
