//
//  Service.swift
//  Pulse
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation

protocol Service {
    var dataParser: DataParser { get }
    var networkProvider: NetworkProvider { get }
}
