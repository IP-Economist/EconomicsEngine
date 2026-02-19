// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "economicengine",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "EconomicEngine",
            targets: [
                "EconomicEngine"
            ]
        )
    ],
    targets: [
        .target(
            name: "EconomicEngine"
        )
    ]
)
