//
//  ElevatorCell.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 10/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

protocol ElevatorCellDelegate: class {
    func openFloor(number: Int)
}

final class ElevatorCell: UITableViewCell {
    @IBOutlet weak var lblFloor: UILabel!
    @IBOutlet weak var vSelect: UIView!
    @IBOutlet weak var vElevator: UIView!
    
    weak var delegate: ElevatorCellDelegate?
    private var floor: Floor?
    
    func configure(with floor: Floor?, delegate: ElevatorCellDelegate?) {
        self.floor = floor
        self.delegate = delegate
        
        guard let floor = floor else { return }
        vSelect.backgroundColor = floor.isSelected ? .brown : .white
        vElevator.backgroundColor = floor.isArrived ? .cyan : .white
        lblFloor.text = "\(floor.number)"
    }
    
    @IBAction func goToFloor(_ sender: UIButton) {
        guard let floor = floor else { return }
        delegate?.openFloor(number: floor.number)
    }
}
