//
//  URLSessionNetworkProviderTest.swift
//  PulseTests
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation
import XCTest

@testable import Pulse

class URLSessionNetworkProviderTest: XCTestCase {

    private var sut: NetworkProvider!
    private var mockSession: URLSession!

    private let endpoint: Endpoint = DummyEndpoint()
    private let reachabilityMock: ReachabilityMock = ReachabilityMock()

    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolMock.self]
        mockSession = URLSession(configuration: configuration)
        sut = URLSessionNetworkProvider(session: mockSession, reachability: reachabilityMock)
    }

    func testShouldReturnValidData() {

        let expectation = XCTestExpectation(description: "response")

        URLProtocolMock.requestHandler = { _ in
            return (HTTPURLResponse(), Data())
        }

        sut.requestData(from: endpoint) { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
                expectation.fulfill()
            case .failure:
                XCTFail("expectation not fullfilled")
            }
        }
    }

    func testShouldReturnEmptyDataErrorWhenThereIsNoResponseFromServer() async throws {

        let expectation = XCTestExpectation(description: "response")

        URLProtocolMock.requestHandler = { _ in
            return (HTTPURLResponse(), nil)
        }

        sut.requestData(from: endpoint) { result in
            switch result {
            case .success:
                XCTFail("expectation not fullfilled")
            case .failure(let error):
                XCTAssertEqual(error, .emptyData)
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 1)
    }

    func testShouldReadDataFromCacheWhenInternetIsNotAvailable() async throws {
        reachabilityMock.forceError = true

        let expectation = XCTestExpectation(description: "response")

        sut.requestData(from: endpoint) { result in
            switch result {
            case .success:
                XCTFail("expectation not fullfilled")
            case .failure(let error):
                XCTAssertEqual(error, .notReachable)
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 1)
    }
}
