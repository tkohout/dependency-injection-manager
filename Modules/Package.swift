// swift-tools-version: 5.7.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [.iOS(.v14)],
    dependencies: []
)

// MARK: - Dependency Injection
package.targets.append(
    contentsOf: [
        .target(
            name: "DI",
            dependencies: [],
            path: "Sources/DI"
        ),
        .testTarget(
            name: "DITests",
            dependencies: ["DI"]
        )
    ]
)

package.products.append(
    contentsOf: [
        .library(
            name: "DI",
            targets: ["DI"]
        )
    ]
)

// MARK: - Core
package.targets.append(
    contentsOf: [
        .target(
            name: "Core",
            dependencies: [],
            path: "Sources/Core"
        )
    ]
)

package.products.append(
    contentsOf: [
        .library(
            name: "Core",
            targets: ["Core"]
        )
    ]
)

// MARK: - Log
package.targets.append(
    contentsOf: [
        .target(
            name: "Log",
            dependencies: [
                "DI"
            ],
            path: "Sources/Log"
        )
    ]
)

package.products.append(
    contentsOf: [
        .library(
            name: "Log",
            targets: ["Log"]
        )
    ]
)

// MARK: - Feature
package.targets.append(
    contentsOf: [
        .target(
            name: "FeatureApi",
            dependencies: [
                "Core"
            ],
            path: "Sources/Feature/Api"
        ),
        .target(
            name: "FeatureImpl",
            dependencies: [
                "Core",
                "DI",
                "FeatureApi",
                "Log"
            ],
            path: "Sources/Feature/Impl"
        )
    ]
)

package.products.append(
    contentsOf: [
        .library(
            name: "FeatureApi",
            targets: ["FeatureApi"]
        ),
        .library(
            name: "FeatureImpl",
            targets: ["FeatureImpl"]
        )
    ]
)
