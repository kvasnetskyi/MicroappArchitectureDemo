//
//  Environment.swift
//  MicroappArchitecture
//
//  Created by Artem Kvasnetskyi on 12.10.2022.
//

import Foundation
import AppContainer

enum Environment: String, AppEnvironment {
    case development
    case staging
    case production
    
    // MARK: - Internal Properties
    var storageBaseURL: URL {
        URL(string: "https://rickandmortydemo-default-rtdb.europe-west1.firebasedatabase.app")!
    }
    
    var authBaseURL: URL {
        URL(string: "https://identitytoolkit.googleapis.com")!
    }
    
    var tokenBaseURL: URL {
        URL(string: "https://securetoken.googleapis.com")!
    }
    
    var authAPIKey: String {
        "AIzaSyCa09W5VQZtpWaVT0ua0mNbhvpM6tibLJk"
    }
}
