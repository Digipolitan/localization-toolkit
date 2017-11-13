import XCTest
@testable import LocalizationToolkit
#if os(OSX)
import AppKit
#else
import UIKit
#endif

class LocalizationToolkitTests: XCTestCase {

    private static let testsBundle = Bundle(for: LocalizationToolkitTests.self)

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

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

    func testLocalizedImage() {
        #if os(OSX)
        let img = NSImage.localizedImageNamed(name: "apple", ofType: "png", bundle: LocalizationToolkitTests.testsBundle)
        #else
        let img = UIImage.localizedImageNamed(name: "apple", ofType: "png", bundle: LocalizationToolkitTests.testsBundle)
        #endif
        XCTAssertNotNil(img)
    }

    func testLoadLocalizedNib() {
        #if os(OSX)
        let nib = NSNib.localizedNibNamed(name: .init("SampleView~osx"), bundle: LocalizationToolkitTests.testsBundle)
        XCTAssertNotNil(nib)
        var topLevelArray: NSArray? = nil
        nib?.instantiate(withOwner: nil, topLevelObjects: &topLevelArray)
        XCTAssert(topLevelArray?.count == 2)
        #else
        let nib = UINib.localizedNibNamed(name: "SampleView", bundle: LocalizationToolkitTests.testsBundle)
        let res = nib.instantiate(withOwner: nil, options: nil)
        XCTAssert(res.count == 1)
        #endif
    }

    func testLoadLocalizedStoryboard() {
        #if os(OSX)
        let storyboard = NSStoryboard.localizedStoryboardNamed(name: .init("SampleStoryboard~osx"), bundle: LocalizationToolkitTests.testsBundle)
        XCTAssertNotNil(storyboard.instantiateInitialController())
        #else
        let storyboard = UIStoryboard.localizedStoryboardNamed(name: "SampleStoryboard", bundle: LocalizationToolkitTests.testsBundle)
        XCTAssertNotNil(storyboard.instantiateInitialViewController())
        #endif
    }
}
