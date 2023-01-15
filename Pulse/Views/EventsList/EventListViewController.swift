//
//  EventListViewController.swift
//  Pulse
//
//  Created by Rafael Lima on 14/01/2023.
//

import Foundation
import UIKit

class EventListViewController: UITableViewController, Storyboarded {

    var sport: Sport?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = sport?.name.capitalized ?? "NoSport"
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
        let event = sport?.events[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventCell
        cell.eventName.text = event?.name ?? ""
        cell.dueDate.text = event?.timeIntervalToToday() ?? ""
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Set as Favorite
    }
}
