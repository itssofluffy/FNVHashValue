# FNVHashValue

[![Swift][swift-badge-3]][swift-url]
[![Swift][swift-badge-4]][swift-url]
[![Build Status][travis-build-badge]][travis-build-url]
![macOS][macos-badge]
![Linux][linux-badge]
[![License][mit-badge]][mit-url]

**A Swift implementation of the Fowler–Noll–Vo (FNV) hash function**

This code provides implementations of the FNV-1 and FNV-1a hash functions in pure Swift. Computes 64-bit hashes on 64-bit devices and 32-bit hashes on 32-bit devices.
Based on original code by [Mauricio Santos](mailto:mauriciosantoss@gmail.com) as [FNVHash-Swift](https://github.com/mauriciosantos/Swift-FNV-Hash) and adaptted to plug directly into Hashable protocol to provide hashValue values (see examples).

## Usage

If [Swift Package Manager](https://github.com/apple/swift-package-manager) is used, add this package as a dependency in `Package.swift`,

```swift
import PackageDescription

let package = Package (
    name:  "<your-app-name>",
    dependencies: [
        .Package(url: "https://github.com/itssofluffy/FNVHashValue.git", majorVersion: 0)
    ]
)
```

## Examples

```swift
extension MyClassA: Hashable {
    public var hashValue: Int {
        return fnv1(self.primaryKey)
    }

    ...
}

extension MyClassB: Hashable {
    public var hashValue: Int {
        return fnv1a(self.primaryKey)
    }

    ...
}

extension MyClassC: Hashable {
    public var hashValue: Int {
        return fnv1(typeToBytes(self.primaryKey1) + typeToBytes(self.primaryKey2))
    }

    ...
}

extension MyClassD: Hashable {
    public var hashValue: Int {
        return fnv1a(typeToBytes(self.primaryKey1) + typeToBytes(self.primaryKey2))
    }

    ...
}
```
 
## Additional information

[Fowler–Noll–Vo hash function](http://www.isthe.com/chongo/tech/comp/fnv/)

## License

This project is released under the MIT license. See [LICENSE](LICENSE) for details.

[swift-badge-3]: https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat
[swift-badge-4]: https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat
[swift-url]: https://swift.org
[travis-build-badge]: https://travis-ci.org/itssofluffy/FNVHashValue.svg?branch=master
[travis-build-url]: https://travis-ci.org/itssofluffy/FNVHashValue
[macos-badge]: https://img.shields.io/badge/os-macOS-green.svg?style=flat
[linux-badge]: https://img.shields.io/badge/os-linux-green.svg?style=flat
[mit-badge]: https://img.shields.io/badge/License-MIT-blue.svg?style=flat
[mit-url]: https://tldrlegal.com/license/mit-license
