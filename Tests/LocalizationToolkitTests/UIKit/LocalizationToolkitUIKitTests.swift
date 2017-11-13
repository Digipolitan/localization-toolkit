import XCTest
import UIKit
@testable import LocalizationToolkit

class LocalizationToolkitUIKitTests: XCTestCase {

    private static let testsBundle = Bundle(for: LocalizationToolkitUIKitTests.self)

    func testLocalizedImage() {
        let img = UIImage.localizedImageNamed(name: "apple", ofType: "png", bundle: LocalizationToolkitUIKitTests.testsBundle)
        XCTAssertNotNil(img)
    }

    func testLoadLocalizedNib() {
        let nib = UINib.localizedNibNamed(name: "SampleView", bundle: LocalizationToolkitUIKitTests.testsBundle)
        let res = nib.instantiate(withOwner: nil, options: nil)
        XCTAssert(res.count == 1)
    }

    func testLoadLocalizedStoryboard() {
        let storyboard = UIStoryboard.localizedStoryboardNamed(name: "SampleStoryboard", bundle: LocalizationToolkitUIKitTests.testsBundle)
        XCTAssertNotNil(storyboard.instantiateInitialViewController())
    }
}
