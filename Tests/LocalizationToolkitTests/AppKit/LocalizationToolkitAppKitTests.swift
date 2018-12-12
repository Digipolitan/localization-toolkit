import XCTest
import AppKit
@testable import LocalizationToolkit

class LocalizationToolkitAppKitTests: XCTestCase {

    private static let testsBundle = Bundle(for: LocalizationToolkitAppKitTests.self)

    func testLocalizedImage() {
        let img = NSImage.localizedImageNamed(name: "apple", ofType: "png", bundle: LocalizationToolkitAppKitTests.testsBundle)
        XCTAssertNotNil(img)
    }

    func testLoadLocalizedNib() {
        let nib = NSNib.localizedNibNamed(name: "SampleView~osx", bundle: LocalizationToolkitAppKitTests.testsBundle)
        XCTAssertNotNil(nib)
        var topLevelArray: NSArray? = nil
        nib?.instantiate(withOwner: nil, topLevelObjects: &topLevelArray)
        XCTAssert(topLevelArray?.count == 2)
    }

    func testLoadLocalizedStoryboard() {
        let storyboard = NSStoryboard.localizedStoryboardNamed(name: "SampleStoryboard~osx", bundle: LocalizationToolkitAppKitTests.testsBundle)
        XCTAssertNotNil(storyboard.instantiateInitialController())
    }
}
