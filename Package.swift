// swift-tools-version:5.1

import PackageDescription

let package = Package(
	name: "FluentCollapsingHeaderView",
    platforms: [.iOS(.v11),],
	products: [
		// Products define the executables and libraries produced by a package, and make them visible to other packages.
		.library(
			name: "FluentCollapsingHeaderView",
			targets: ["FluentCollapsingHeaderView"]
		)
	],
	dependencies: [],
	targets: [
		.target(name: "FluentCollapsingHeaderView",
				dependencies: [],
				path: "Source"
		)
		]
)
