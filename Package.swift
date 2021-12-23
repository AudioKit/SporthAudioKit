// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SporthAudioKit",
    platforms: [.macOS(.v10_13), .iOS(.v11), .tvOS(.v11)],
    products: [.library(name: "SporthAudioKit", targets: ["SporthAudioKit"])],
    dependencies: [.package(url: "https://github.com/AudioKit/SoundpipeAudioKit", from: "5.3.0")],
    targets: [
        .target(name: "Sporth", dependencies: ["SoundpipeAudioKit"]),
        .target(name: "SporthAudioKit", dependencies: ["SoundpipeAudioKit", "CSporthAudioKit", "Sporth"]),
        .target(name: "CSporthAudioKit", dependencies: ["SoundpipeAudioKit", "Sporth"]),
        .testTarget(name: "SporthAudioKitTests", dependencies: ["SporthAudioKit"]),
        .testTarget(name: "CSporthAudioKitTests", dependencies: ["CSporthAudioKit"])
    ],
    cxxLanguageStandard: .cxx14
)
