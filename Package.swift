// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "AoC-2024",
	platforms: [
		.macOS(.v13)
	],
	targets: [
		// Targets are the basic building blocks of a package, defining a module or a test suite.
		// Targets can depend on other targets in this package and products from dependencies.
		.executableTarget(name: "AoC-2024-1", path: "Sources/1"),
		.executableTarget(name: "AoC-2024-2", path: "Sources/2"),

		.testTarget(name: "AoC-2024-2-Tests", dependencies: ["AoC-2024-2"], path: "Tests/2"),
	]
)
