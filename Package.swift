import PackageDescription

let package = Package(
    name: "FNVHashValue",
    dependencies: [
        .Package (
            url:          "https://github.com/itssofluffy/ISFLibrary.git",
            majorVersion: 0
        )
    ]
)
