// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SporthAudioKit",
    platforms: [
        .macOS(.v10_14), .iOS(.v11), .tvOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SporthAudioKit",
            targets: ["SporthAudioKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/AudioKit/Soundpipe", .branch("main")),
        .package(url: "https://github.com/AudioKit/AudioKit", .branch("develop")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "Sporth", dependencies: ["Soundpipe"]),
        .target(
            name: "SporthAudioKit",
            dependencies: ["AudioKit", "CSporthAudioKit", "Sporth"]),
        .target(
            name: "CSporthAudioKit",
            dependencies: ["AudioKit", "Sporth"]),
        .testTarget(
            name: "SporthAudioKitTests",
            dependencies: ["SporthAudioKit"]),
    ],
    cxxLanguageStandard: .cxx14
)