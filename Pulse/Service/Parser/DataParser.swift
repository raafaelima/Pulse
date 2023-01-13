//
//  DataParser.swift
//  Pulse
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation

protocol DataParser {
    func process<T: Codable>(data: Data) throws -> T
}
