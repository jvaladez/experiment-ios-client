// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "experiment-ios-client",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14),
        .watchOS(.v7)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Experiment",
            targets: ["Experiment"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/jvaladez/analytics-connector-ios.git")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Experiment",
            dependencies: [
                .product(name: "AnalyticsConnector", package: "analytics-connector-ios")
            ],
            path: "Sources/Experiment",
            exclude: ["Info.plist"]),
        .testTarget(
            name: "ExperimentTests",
            dependencies: ["Experiment"],
            path: "Tests/ExperimentTests",
            exclude: ["Info.plist"]),
    ]
)
