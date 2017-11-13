// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "LocalizationToolkit",
    products: [
        .library(name: "LocalizationToolkit", targets: ["LocalizationToolkit"])
    ],
    targets: [
        .target(name: "LocalizationToolkit", exclude: [
            "UIKit",
            "AppKit"
        ]),
        .testTarget(
            name: "LocalizationToolkitTests",
            dependencies: [
                "LocalizationToolkit"
            ],
            exclude: [
                "UIKit",
                "AppKit"
            ]
        )
    ]
)
