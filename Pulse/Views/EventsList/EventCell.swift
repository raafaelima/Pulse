//
//  EventCell.swift
//  Pulse
//
//  Created by Rafael Lima on 15/01/2023.
//

import Foundation
import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    @IBOutlet weak var favoriteStar: UIImageView!

    func setupWith(event: Event) {
        eventName.text = event.name
        dueDate.text = event.timeIntervalToToday()

        if #available(iOS 13, *) {
            favoriteStar.image = event.isFavorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        } else {
            favoriteStar.image = event.isFavorite ? UIImage(named: "favorite.fill") : UIImage(named: "favorite.fill")
        }
    }
}
