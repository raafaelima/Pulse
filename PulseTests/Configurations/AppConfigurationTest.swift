//
//  AppConfigurationTest.swift
//  PulseTests
//
//  Created by Rafael Lima on 13/01/2023.
//

import XCTest

@testable import Pulse

class AppConfigurationTest: XCTestCase {

    func testHostIsFilled() throws {
        let host = AppConfiguration.shared.host
        XCTAssertEqual(host, "http://testhost.com")
    }

    func testPrivateContentTypeIsFilled() throws {
        let contentType = AppConfiguration.shared.contentType
        XCTAssertEqual(contentType, "application/json")
    }
}
