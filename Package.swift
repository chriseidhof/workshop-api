// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WorkshopAPI",
    platforms: [.macOS(.v12)],
    products: [
        .library(
            name: "WorkshopAPI",
            targets: ["WorkshopAPI"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WorkshopAPI",
            dependencies: []),
    ]
)
