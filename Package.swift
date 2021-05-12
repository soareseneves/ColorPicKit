// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "ColorPicKit",
    defaultLocalization: "en",
    platforms: [
        .iOS("9.0")
    ],
    products: [
        .library(name: "ColorPicKit", targets: ["ColorPicKit"])
    ],
    targets: [
        .target(
            name: "ColorPicKit",
            path: "ColorPicKit",
            exclude: [
                "Info.plist",
            ],
            resources: [.process("Resources")]
        )
    ]
)
