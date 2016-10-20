/*
    Copyright (c) 2016 Stephen Whittle  All rights reserved.

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"),
    to deal in the Software without restriction, including without limitation
    the rights to use, copy, modify, merge, publish, distribute, sublicense,
    and/or sell copies of the Software, and to permit persons to whom
    the Software is furnished to do so, subject to the following conditions:
    The above copyright notice and this permission notice shall be included
    in all copies or substantial portions of the Software.
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
    THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
    FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
    IN THE SOFTWARE.
*/

//  A Swift implementation of the Fowler–Noll–Vo (FNV) hash function
//  See http://www.isthe.com/chongo/tech/comp/fnv/
//
//  Originally Created by Mauricio Santos on 3/9/15. please see https://github.com/mauriciosantos/FNVHash-Swift.git
//
//  Modified to compile as a swift (added swift 3 changes) library and convert hash values directly to an Int
//  for Hashable protocols hashValue property by Steve Whittle 19th September 2016

import ISFLibrary

/// MARK:- Constants

private struct Constants {
    // FNV parameters
#if arch(arm64) || arch(x86_64) // 64-bit
    static let OffsetBasis: UInt = 14695981039346656037
    static let FNVPrime:    UInt = 1099511628211
#else                           // 32-bit
    static let OffsetBasis: UInt = 2166136261
    static let FNVPrime:    UInt = 16777619
#endif
}

/// MARK:- Public API

/// Calculates FNV-1 hash from a raw byte sequence, such as an array.
public func fnv1<S: Sequence>(_ bytes: S) -> Int where S.Iterator.Element == UInt8 {
    var hash = Constants.OffsetBasis

    for byte in bytes {
        hash = hash &* Constants.FNVPrime // &* means multiply with overflow
        hash ^= UInt(byte)
    }

    return Int(bitPattern: hash)
}

/// Calculates FNV-1a hash from a raw byte sequence, such as an array.
public func fnv1a<S: Sequence>(_ bytes: S) -> Int where S.Iterator.Element == UInt8 {
    var hash = Constants.OffsetBasis

    for byte in bytes {
        hash ^= UInt(byte)
        hash = hash &* Constants.FNVPrime // &* means multiply with overflow
    }

    return Int(bitPattern: hash)
}

/// Calculates FNV-1 hash from an integer type.
public func fnv1<T: Integer>(_ value: T) -> Int {
    return fnv1(typeToBytes(value))
}

/// Calculates FNV-1a hash from an integer type.
public func fnv1a<T: Integer>(_ value: T) -> Int {
    return fnv1a(typeToBytes(value))
}

/// Calculates FNV-1 hash from a floating point type.
public func fnv1<T: FloatingPoint>(_ value: T) -> Int {
    return fnv1(typeToBytes(value))
}

/// Calculates FNV-1a hash from a floating point type.
public func fnv1a<T: FloatingPoint>(_ value: T) -> Int {
    return fnv1a(typeToBytes(value))
}

/// Calculates FNV-1 hash from a String using it's UTF8 representation.
public func fnv1(_ value: String) -> Int {
    return fnv1(value.utf8)
}

/// Calculates FNV-1a hash from a String using it's UTF8 representation.
public func fnv1a(_ value: String) -> Int {
    return fnv1a(value.utf8)
}
