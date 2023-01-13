//
//  Coordinator.swift
//  Pulse
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
