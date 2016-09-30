import XCTest
@testable import FNVHashValue

class FNVHashValueTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(FNVHashValue().text, "Hello, World!")
    }


    static var allTests : [(String, (FNVHashValueTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
