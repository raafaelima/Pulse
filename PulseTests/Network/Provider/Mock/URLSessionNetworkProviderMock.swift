//
//  URLSessionNetworkProviderMock.swift
//  PulseTests
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation

@testable import Pulse

class URLSessionNetworkProviderMock: NetworkProvider {

    var forceError = false
    var didCallRequestData = false
    var endpointRequestURL = ""
    var reachability: ReachabilityType = ReachabilityMock()

    func requestData(from endpoint: Endpoint, completion: @escaping (Result<Data, ApiError>) -> Void) {
        self.didCallRequestData = true
        self.endpointRequestURL = endpoint.urlRequest().url!.absoluteString

        if forceError {
            completion(.failure(.generic))
        } else {
            let dummyData = JSONHelper.getDataFrom(json: "upcoming-sports")!
            completion(.success(dummyData))
        }
    }
}
