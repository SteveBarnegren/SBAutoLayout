// swift-tools-version:5.1
import PackageDescription

let package = Package(name: "SBAutoLayout",
                      platforms: [.macOS(.v10_12),
                                  .iOS(.v8)],
                      products: [.library(name: "SBAutoLayout",
                                          targets: ["SBAutoLayout"])],
                      targets: [.target(name: "SBAutoLayout",
                                        path: "SBAutoLayout/SBAutoLayout")],
                      swiftLanguageVersions: [.v5])
