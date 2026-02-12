// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SILiveStream",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "SILiveStream",
            targets: ["SILiveStreamBinary"]
        )
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "SILiveStreamBinary",
            path: "Binaries/SILiveStream.xcframework"
        )
    ]
)
