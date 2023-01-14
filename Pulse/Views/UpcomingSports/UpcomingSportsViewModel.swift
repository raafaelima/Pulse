//
//  UpcomingSportsViewModel.swift
//  Pulse
//
//  Created by Rafael Lima on 14/01/2023.
//

import Foundation

class UpcomingSportsViewModel {

    var upcomingSports: [Sport] = []
    private let service: SportService
    private let viewDelegate: UpcomingSportsView

    init(viewDelegate: UpcomingSportsView, service: SportService = SportService()) {
        self.service = service
        self.viewDelegate = viewDelegate
    }

    func fetchSports() {
        self.service.fetchUpcomingSports { [weak self] sports in
            DispatchQueue.main.async {
                self?.upcomingSports = sports
                self?.viewDelegate.reloadUI()
            }
        }
    }
}
