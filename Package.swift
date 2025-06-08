// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "TreeSitterHCL",
    products: [
        .library(name: "TreeSitterHCL", targets: ["TreeSitterHCL"]),
    ],
    dependencies: [
        .package(name: "SwiftTreeSitter", url: "https://github.com/tree-sitter/swift-tree-sitter", from: "0.25.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterHCL",
            dependencies: [],
            path: ".",
            sources: [
                "src/parser.c",
                "src/scanner.c"
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [
                .define("_DARWIN_C_SOURCE"),
                .define("BYTE_ORDER=1234"),
                .headerSearchPath("src")
            ]
        ),
        .testTarget(
            name: "TreeSitterHCLTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterHCL",
            ],
            path: "bindings/swift/TreeSitterHCLTests",
            cSettings: [
                .define("_DARWIN_C_SOURCE"),
                .define("BYTE_ORDER=1234")
            ]
        )
    ],
    cLanguageStandard: .c11
)
