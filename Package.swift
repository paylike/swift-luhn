// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "PaylikeLuhn",
    platforms: [.macOS(.v10_15), .iOS(.v13)],
    products: [
        .library(name: "PaylikeLuhn", targets: ["PaylikeLuhn"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "PaylikeLuhn", dependencies: []),
        .testTarget(name: "PaylikeLuhnTests", dependencies: ["PaylikeLuhn"]),
    ],
    swiftLanguageVersions: [.v5]
)
