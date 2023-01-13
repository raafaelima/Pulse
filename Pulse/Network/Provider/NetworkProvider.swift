//
//  NetworkProvider.swift
//  Pulse
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation

protocol NetworkProvider {
    var reachability: ReachabilityType { get }
    func requestData(from endpoint: Endpoint, completion: @escaping (Result<Data, ApiError>) -> Void)
}
