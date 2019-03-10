//
//  ElevatorCell.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 10/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

final class ElevatorCell: UITableViewCell {
    @IBOutlet weak var lblFloor: UILabel!
    @IBOutlet weak var vSelect: UIView!
    @IBOutlet weak var vElevator: UIView!
    
    func configure(with floor: Floor?) {
        guard let floor = floor else { return }
        vSelect.backgroundColor = floor.isSelected ? .brown : .white
        vElevator.backgroundColor = floor.isArrived ? .cyan : .white
        lblFloor.text = "\(floor.number)"
    }
}
