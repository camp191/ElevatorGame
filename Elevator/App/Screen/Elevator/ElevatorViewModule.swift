//
//  ElevatorViewModule.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 10/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

protocol ElevatorViewInput: class {
    func reloadTableViewRow(indexPaths: [IndexPath])
}

protocol ElevatorViewOutput {
    func getCurrentElevatorFloor() -> String
    func getLastFloorIndexPath() -> IndexPath
    func getFloorCount() -> Int
    func getFloor(index: Int) -> Floor
    func selectRow(index: Int)
    func invalidateTimer()
}
