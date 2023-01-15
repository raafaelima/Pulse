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
    private var viewModel: UpcomingSportsViewModel!
    private let loadingView = UIActivityIndicatorView(style: .gray)

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = UpcomingSportsViewModel(viewDelegate: self)
        fetchSports()
    }

    private func fetchSports() {
        viewModel.fetchSports()
        startLoading()
    }

    private func startLoading() {
        tableView.backgroundView = loadingView
        loadingView.startAnimating()
    }
}

// MARK: - Table view data source
extension UpcomingSportsViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Sports"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.upcomingSports.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sport = viewModel.upcomingSports[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "sportCell", for: indexPath)
        cell.detailTextLabel?.text = sport.id
        cell.textLabel?.text = sport.name.capitalized
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sport = viewModel.upcomingSports[indexPath.row]
        coordinator?.events(of: sport)
    }
}

// MARK: - ViewModel Binding
extension UpcomingSportsViewController: UpcomingSportsView {
    func reloadUI() {
        tableView.reloadData()
        loadingView.stopAnimating()
    }
}
