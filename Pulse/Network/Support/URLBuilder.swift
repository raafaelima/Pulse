//
//  AppDelegate.swift
//  Pulse
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation

protocol URLBuilding {
    func build(to path: String, with params: [URLQueryItem]) -> URL
}

struct URLBuilder: URLBuilding {

    func build(to path: String = "", with params: [URLQueryItem] = []) -> URL {
        var components = URLComponents(string: host() + path)
        components?.queryItems = []
        components?.queryItems?.append(contentsOf: params)
        return (components?.url)!
    }

    private func host() -> String {
        return AppConfiguration.shared.host
    }
}
