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
        let upcomingSports = UpcomingSportsViewController.instantiate()
        upcomingSports.coordinator = self
        navigationController.pushViewController(upcomingSports, animated: false)
    }

    func events(of sport: Sport) {
        let eventList = EventListViewController.instantiate()
        eventList.sport = sport
        navigationController.pushViewController(eventList, animated: true)
    }
}
