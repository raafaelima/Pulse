//
//  SportServiceTest.swift
//  PulseTests
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation
import XCTest

@testable import Pulse

class SportServiceTest: XCTestCase {

    var sut: SportService!

    private let dataParserMock = JsonDataParserMock()
    private let  networkProviderMock = URLSessionNetworkProviderMock()

    override func setUp() {
        super.setUp()
        sut = SportService(dataParser: dataParserMock, networkProvider: networkProviderMock)
    }

    func testServiceReturnListWhenTheDataIsValid() {
        let expectation = XCTestExpectation(description: "response")

        sut.fetchUpcomingSports { sports in
            XCTAssertEqual(sports.count, 2)
            XCTAssertEqual(sports[0].id, "SNOO")
            XCTAssertEqual(sports[0].events.count, 1)
            XCTAssertEqual(sports[0].events[0].description, "Judd Trump - Mark Allen")

            XCTAssertEqual(sports[1].id, "BADM")
            XCTAssertEqual(sports[1].events.count, 1)
            XCTAssertEqual(sports[1].events[0].description, "Miklos Kis Kasza / Vivien Sandorhazi - Csanad Horvath / Carey Hart")

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func testReturnEmptyArrayWhenDataIsInvalid() {
        networkProviderMock.forceError = true

        let expectation = XCTestExpectation(description: "response")

        sut.fetchUpcomingSports { sports in
            XCTAssertEqual(sports.count, 0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func testReturnEmptyArrayWhenParsedDataIsInvalid() {
        dataParserMock.forceError = true

        let expectation = XCTestExpectation(description: "response")

        sut.fetchUpcomingSports { sports in
            XCTAssertEqual(sports.count, 0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }
}
