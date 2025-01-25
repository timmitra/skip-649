import XCTest
import OSLog
import Foundation
@testable import Skip649

let logger: Logger = Logger(subsystem: "Skip649", category: "Tests")

@available(macOS 13, *)
final class Skip649Tests: XCTestCase {

    func testSkip649() throws {
        logger.log("running testSkip649")
        XCTAssertEqual(1 + 2, 3, "basic test")
    }

    func testDecodeType() throws {
        // load the TestData.json file from the Resources folder and decode it into a struct
        let resourceURL: URL = try XCTUnwrap(Bundle.module.url(forResource: "TestData", withExtension: "json"))
        let testData = try JSONDecoder().decode(TestData.self, from: Data(contentsOf: resourceURL))
        XCTAssertEqual("Skip649", testData.testModuleName)
    }

}

struct TestData : Codable, Hashable {
    var testModuleName: String
}
