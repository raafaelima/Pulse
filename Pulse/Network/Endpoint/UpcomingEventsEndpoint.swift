//
//  UpcomingEventsEndpoint.swift
//  Pulse
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation

struct UpcomingEventsEndpoint: Endpoint {
    var path: EndpointPath = .upcomingEvents
    var params: [URLQueryItem] = []
}
