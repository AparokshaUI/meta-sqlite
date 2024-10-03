// swift-tools-version: 6.0
//
//  Package.swift
//  meta-sqlite
//
//  Created by david-swift on 04.10.24.
//

import PackageDescription

/// The meta-sqlite package is part of the Aparoksha project.
let package = Package(
    name: "meta-sqlite",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "MetaSQLite",
            targets: ["MetaSQLite"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/AparokshaUI/Meta", branch: "main"),
        .package(url: "https://github.com/stephencelis/SQLite.swift", from: "0.15.3")
    ],
    targets: [
        .target(
            name: "MetaSQLite",
            dependencies: ["Meta", .product(name: "SQLite", package: "SQLite.swift")],
            path: "Sources"
        ),
        .executableTarget(
            name: "Tests",
            dependencies: ["MetaSQLite"],
            path: "Tests"
        )
    ],
    swiftLanguageModes: [.v5]
)
