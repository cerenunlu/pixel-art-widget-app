// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "PixelAmbientWidgets",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "PixelAmbientWidgetsShared",
            targets: ["PixelAmbientWidgetsShared"]
        )
    ],
    targets: [
        .target(
            name: "PixelAmbientWidgetsShared",
            path: "Shared"
        ),
        .testTarget(
            name: "PixelAmbientWidgetsSharedTests",
            dependencies: ["PixelAmbientWidgetsShared"],
            path: "Tests/PixelAmbientWidgetsSharedTests"
        )
    ]
)
