//
//  FloorCell.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 17/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

final class FloorCell: UITableViewCell {
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var lblTimestamp: UILabel!
    
    func configure(index: Int, timeStamp: TimeInterval?) {
        lblNumber.text = "\(index + 1)"
        lblTimestamp.text = "\(getDate(timestamp: timeStamp ?? 0))"
    }
    
    private func getDate(timestamp: TimeInterval) -> String {
        let now = Date(timeIntervalSince1970: timestamp)
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter.string(from: now)
    }
}
