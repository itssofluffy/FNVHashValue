[FNVHashValue](https://github.com/itssofluffy/FNVHashValue)
====================
**A Swift implementation of the Fowler–Noll–Vo (FNV) hash function**

This code provides implementations of the FNV-1 and FNV-1a hash functions in pure Swift. Computes 64-bit hashes on 64-bit devices and 32-bit hashes on 32-bit devices.
Based on original code by [Mauricio Santos](mailto:mauriciosantoss@gmail.com) as [FNVHash-Swift](https://github.com/mauriciosantos/Swift-FNV-Hash) and adaptted to plug directly into Hashable protocol to provide hashValue values (see examples).

## Usage

If [Swift Package Manager](https://github.com/apple/swift-package-manager) is
used, add this package as a dependency in `Package.swift`,

```swift
.Package(url: "https://github.com/itssofluffy/FNVHashValue.git", majorVersion: 0)
```

Examples
--------------------

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
 
Additional information
--------------------

[Fowler–Noll–Vo hash function](http://www.isthe.com/chongo/tech/comp/fnv/)
