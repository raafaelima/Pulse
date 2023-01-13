//
//  Endpoint.swift
//  Pulse
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation

protocol Endpoint {
    var path: EndpointPath { get set }
    var params: [URLQueryItem] { get set }
}
