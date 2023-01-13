//
//  SportsService.swift
//  Pulse
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation

class SportService: Service {

    var dataParser: DataParser
    var networkProvider: NetworkProvider

    init(dataParser: DataParser = JsonDataParser(),
         networkProvider: NetworkProvider = URLSessionNetworkProvider()) {
        self.dataParser = dataParser
        self.networkProvider = networkProvider
    }

    func fetchUpcomingSports(completion: @escaping ([Sport]) -> Void) {
        let endpoint = UpcomingEventsEndpoint()

        networkProvider.requestData(from: endpoint) { [weak self] result in
            switch result {
            case .success(let data):
                self?.parseDataToModel(data, completion)
            case .failure(let error):
                self?.raiseErrorAtLoadingData(error, completion)
            }
        }
    }

    private func parseDataToModel(_ data: Data, _ completion: @escaping ([Sport]) -> Void) {
        do {
            let parsedData: [Sport] = try dataParser.process(data: data)
            completion(parsedData)
        } catch {
            raiseErrorAtLoadingData(error, completion)
        }
    }

    private func raiseErrorAtLoadingData(_ error: Error, _ completion: @escaping ([Sport]) -> Void) {
        print("Error at Loading Data: \(error.localizedDescription)")
        completion([])
    }
}
