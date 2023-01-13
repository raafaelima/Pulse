//
//  TestingRootViewController.swift
//  PulseTests
//
//  Created by Rafael Lima on 13/01/2023.
//

import UIKit

class TestingRootViewController: UIViewController {

    override func loadView() {
        let label = UILabel()
        label.text = "Running Unit Tests..."
        label.textAlignment = .center
        label.textColor = .white

        view = label
    }
}
