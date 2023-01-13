//
//  DummyEndpoint.swift
//  PulseTests
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation

@testable import Pulse

struct DummyEndpoint: Endpoint {
    var path: EndpointPath = .currentWeather
    var params: [URLQueryItem] = []
}
