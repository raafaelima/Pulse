//
//  JsonDataParserMock.swift
//  PulseTests
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation

@testable import Pulse

class JsonDataParserMock: DataParser {

    var forceError: Bool = false

    func process<T: Codable>(data: Data) throws -> T {
        if forceError {
            throw ParserError.invalidData
        } else {
            return JSONHelper.getObjectFrom(json: "upcoming-sports", type: T.self)!
        }
    }
}
