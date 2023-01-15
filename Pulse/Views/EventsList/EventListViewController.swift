//
//  EventListViewController.swift
//  Pulse
//
//  Created by Rafael Lima on 14/01/2023.
//

import Foundation
import UIKit

class EventListViewController: UITableViewController, Storyboarded {

    var sport: Sport!
    var favories: [Event] = []
    var viewModel: EventListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = EventListViewModel()
        self.title = sport.name.capitalized
    }
}

// MARK: - Table view data source
extension EventListViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Events"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sport?.events.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var event = sport.events[indexPath.row]
        event.isFavorite = viewModel.isFavorite(event: event)

        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventCell
        cell.setupWith(event: event)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = sport.events[indexPath.row]
        viewModel.favorite(event: event)
        tableView.reloadData()
    }
}
