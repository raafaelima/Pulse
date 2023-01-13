//
//  UrlBuilderTest.swift
//  PulseTests
//
//  Created by Rafael Lima on 13/01/2023.
//

import XCTest

@testable import Pulse

class UrlBuilderTest: XCTestCase {

    var sut: URLBuilder!

    override func setUp() {
        super.setUp()
        sut = URLBuilder()
    }

    func testWhenThereAreNoParamsShouldReturnTheStandardURL() throws {
        let url = sut.build()
        XCTAssertEqual(url.host, "testhost.com")
    }

    func testVerifyURLParamsBuilder() throws {
        let dummyItem = URLQueryItem(name: "dummy", value: "thisIsADummyParam")
        let url = sut.build(with: [dummyItem])
        XCTAssertTrue(url.query!.contains("dummy=thisIsADummyParam"))
    }
}
