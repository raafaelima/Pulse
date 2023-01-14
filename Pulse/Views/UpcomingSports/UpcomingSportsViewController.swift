//
//  UpcomingSportsViewController.swift
//  Pulse
//
//  Created by Rafael Lima on 13/01/2023.
//

import Foundation
import UIKit

class UpcomingSportsViewController: UITableViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    private var viewModel: UpcomingSportsViewModel?
    private let loadingView = UIActivityIndicatorView(style: .gray)

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = UpcomingSportsViewModel(viewDelegate: self)
        fetchSports()
    }

    private func fetchSports() {
        viewModel?.fetchSports()
        startLoading()
    }

    private func startLoading() {
        tableView.backgroundView = loadingView
        loadingView.startAnimating()
    }
}

// MARK: - Table view data source
extension UpcomingSportsViewController {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel?.upcomingSports[section].name.capitalized ?? ""
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.upcomingSports.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventCell
        cell.events = viewModel?.upcomingSports[indexPath.row].events
        return cell
    }
}

// MARK: - ViewModel Binding
extension UpcomingSportsViewController: UpcomingSportsView {
    func reloadUI() {
        tableView.reloadData()
        loadingView.stopAnimating()
    }
}
