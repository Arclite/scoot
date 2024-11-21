// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "scoot",
    platforms: [.macOS(.v14), .iOS(.v17), .tvOS(.v17)],
    products: [
        .executable(name: "scoot", targets: ["scoot"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.5.0"),
    ],
    targets: [
        .executableTarget(name: "scoot",
                          dependencies: [
                              .product(name: "Hummingbird", package: "hummingbird"),
                          ]
        )
    ]
)
