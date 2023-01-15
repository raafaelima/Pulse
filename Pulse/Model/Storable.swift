//
//  Storable.swift
//  Pulse
//
//  Created by Rafael Lima on 15/01/2023.
//

import Foundation

protocol Storable: Encodable, Decodable {
    var id: String { get set }
}
