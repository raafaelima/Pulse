//
//  URLSessionNetworkProvider.swift
//  Pulse
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation

struct URLSessionNetworkProvider: NetworkProvider {

    var session: URLSession
    var reachability: ReachabilityType
    private let httpSuccess = 200

    init(session: URLSession = .shared, reachability: ReachabilityType = Reachability()) {
        self.session = session
        self.reachability = reachability
    }

    func requestData(from endpoint: Endpoint, completion: @escaping (Result<Data, ApiError>) -> Void) {

        if reachability.currentStatus() == .notReachable {
            completion(.failure(.notReachable))
        } else {

            let remoteDataTask = session.dataTask(with: endpoint.urlRequest()) { data, response, _ in

                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == httpSuccess else {
                    completion(.failure(.generic))
                    return
                }

                guard let receivedData = data else {
                    completion(.failure(.emptyData))
                    return
                }

                completion(.success(receivedData))
            }

            remoteDataTask.resume()
        }
    }
}
