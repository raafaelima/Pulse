//
//  MainCoordinator.swift
//  Pulse
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = UpcomingSportsViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

    func events(of sport: Sport) {

    }
}
