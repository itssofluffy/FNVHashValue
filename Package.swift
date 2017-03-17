import PackageDescription

let package = Package(
    name: "FNVHashValue",
    dependencies: [
        .Package (url: "https://github.com/itssofluffy/ISFLibrary.git", majorVersion: 0)
    ]
)

let staticLibrary = Product(
    name:    "FNVHashValue",
    type:    .Library(.Static),
    modules: ["FNVHashValue"]
)

let dynamicLibrary = Product(
    name:    "FNVHashValue",
    type:    .Library(.Dynamic),
    modules: ["FNVHashValue"]
)

products.append(staticLibrary)
products.append(dynamicLibrary)
