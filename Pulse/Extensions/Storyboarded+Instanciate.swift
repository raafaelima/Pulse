//
//  Storyboarded+Instanciate.swift
//  Pulse
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation
import UIKit

extension Storyboarded where Self: UIViewController {

    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        // swiftlint:disable force_cast
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
