// swift-tools-version:5.3
import PackageDescription

let package = Package(name: "SBAutoLayout",
                      platforms: [.macOS(.v11),
                                  .iOS(.v11)],
                      products: [.library(name: "SBAutoLayout",
                                          targets: ["SBAutoLayout"])],
                      targets: [.target(name: "SBAutoLayout",
                                        path: "SBAutoLayout/SBAutoLayout")],
                      swiftLanguageVersions: [.v5])
