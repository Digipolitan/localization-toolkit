import XCTest
@testable import LocalizationToolkit

class LocalizationToolkitTests: XCTestCase {

    private static let testsBundle = Bundle(for: LocalizationToolkitTests.self)

    func testHello() {
        XCTAssertEqual("test_key".localized(bundle: LocalizationToolkitTests.testsBundle), "Hello")
    }

    func testBye() {
        XCTAssertEqual("test_key".localized(bundle: LocalizationToolkitTests.testsBundle, table: "Others"), "Bye")
    }

    func testHelloWithArgs() {
        XCTAssertEqual("test_args".localized(bundle: LocalizationToolkitTests.testsBundle, arguments: "Jean", "Louis"), "test_args")
    }

    func testByeWithArgs() {
        XCTAssertEqual("test_args".localized(bundle: LocalizationToolkitTests.testsBundle, table: "Others", arguments: "Jean", "Louis"), "Bye mr Louis, Hello mr Jean")
    }
}
