// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    defaultLocalization: "en",
    platforms: [.iOS(.v16)],
    products: [
        // MARK: - Feature
        .library(name: "FeatureModules", targets: [
            "Authentication", "Home"
        ]),
        .library(name: "Authentication", targets: ["Authentication"]),
        .library(name: "Home", targets: ["Home"]),
        
        // MARK: - Utility
        .library(name: "UtilityModules", targets: [
            "Base", "Entities", "Extensions", "Helpers", "Navigation"
        ]),
        .library(name: "Entities", targets: ["Entities"]),
        .library(name: "Extensions", targets: ["Extensions"]),
        .library(name: "Helpers", targets: ["Helpers"]),
        .library(name: "Navigation", targets: ["Navigation"]),
        
        // MARK: - Foundation
        .library(name: "FoundationModules", targets: [
            "AppContainer", "Networking", "Storage"
        ]),
        .library(name: "AppContainer", targets: ["AppContainer"]),
        .library(name: "Networking", targets: ["Networking"]),
        .library(name: "Storage", targets: ["Storage"]),
        
        // MARK: - UI
        .library(name: "UIModules", targets: ["Resources", "Views"]),
        .library(name: "Resources", targets: ["Resources"]),
        .library(name: "Views", targets: ["Views"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/kvasnetskyi/CombineNetworking",
            .upToNextMajor(from: "0.1.3")
        ),
        .package(
            url: "https://github.com/kishikawakatsumi/KeychainAccess",
            .upToNextMajor(from: "4.0.0")
        ),
        .package(
            url: "https://github.com/Swinject/Swinject",
            .upToNextMajor(from: "2.8.3")
        ),
        .package(
            url: "https://github.com/freshOS/KeyboardLayoutGuide",
            .upToNextMajor(from: "1.8.0")
        ),
        .package(
            url: "https://github.com/onevcat/Kingfisher",
            .upToNextMajor(from: "7.5.0")
        )
    ],
    targets: [
        // MARK: - Feature
        .target(
            name: "Authentication",
            dependencies: [
                // Utility
                .target(name: "Base"),
                .target(name: "Entities"),
                .target(name: "Navigation"),
                
                // UI
                .target(name: "Resources"),
                .target(name: "Views")
            ],
            path: "Sources/FeatureModules/Authentication",
            resources: [.process("Resources/Process")]
        ),
        .target(
            name: "Home",
            dependencies: [
                // Utility
                .target(name: "Base"),
                .target(name: "Entities"),
                .target(name: "Extensions"),
                .target(name: "Navigation"),
                .target(name: "Helpers"),
                
                // UI
                .target(name: "Resources"),
                .target(name: "Views"),
                
                // Third Party
                .byName(name: "Kingfisher")
            ],
            path: "Sources/FeatureModules/Home",
            resources: [.process("Resources/Process")]
        ),
        
        // MARK: - Utility
        .target(
            name: "Base",
            dependencies: [
                .target(name: "Entities"),
                .target(name: "Views")
            ],
            path: "Sources/UtilityModules/Base"
        ),
        .target(name: "Entities", path: "Sources/UtilityModules/Entities"),
        .target(
            name: "Extensions",
            dependencies: [.byName(name: "KeyboardLayoutGuide")],
            path: "Sources/UtilityModules/Extensions"
        ),
        .target(
            name: "Helpers",
            dependencies: [
                .target(name: "Navigation"),
            ],
            path: "Sources/UtilityModules/Helpers"
        ),
        .target(name: "Navigation", path: "Sources/UtilityModules/Navigation"),
        
        // MARK: - Foundation
        .target(
            name: "AppContainer",
            dependencies: [
                .byName(name: "CombineNetworking"),
                .byName(name: "Swinject"),
                .target(name: "Networking"),
                .target(name: "Storage")
            ],
            path: "Sources/FoundationModules/AppContainer"
        ),
        .target(
            name: "Networking",
            dependencies: [
                .target(name: "Entities"),
                .target(name: "Storage"),
                .byName(name: "CombineNetworking")
            ],
            path: "Sources/FoundationModules/Networking"
        ),
        .target(
            name: "Storage",
            dependencies: [
                .target(name: "Entities"),
                .byName(name: "KeychainAccess")
            ],
            path: "Sources/FoundationModules/Storage"
        ),
        
        // MARK: - UI
        .target(
            name: "Resources",
            path: "Sources/UIModules/Resources",
            resources: [.process("Process")]
        ),
        .target(
            name: "Views",
            dependencies: [
                .target(name: "Resources")
            ],
            path: "Sources/UIModules/Views"
        )
    ]
)
