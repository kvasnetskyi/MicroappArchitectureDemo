//
//  UserAuthData.swift
//  MVVMSkeleton
//
//  Created by user on 22.01.2022.
//

import Foundation

public protocol UserAuthData {
    var idToken: String { get }
    var refreshToken: String { get }
}
