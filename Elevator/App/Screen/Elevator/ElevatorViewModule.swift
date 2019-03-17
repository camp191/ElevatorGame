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
    func setFloorLabel(with text: String?)
}

protocol ElevatorViewOutput {
    func viewIsReady()
    func getLastFloorIndexPath() -> IndexPath
    func getFloorCount() -> Int
    func getFloor(index: Int) -> Floor
    func selectRow(index: Int)
    func tapSelectFloor(from floorIndex: Int)
}

protocol ElevatorRouterInput {
    func navigate(to floor: Int, elevatorManager: ElevatorManager)
}

protocol ElevatorViewInteractorInput {
    func getFloorCount() -> Int
    func setCurrentFloor(index: Int)
    func getCurrentFloorIndex() -> Int
    func setSelectedFloor(index: Int)
    func getSelectedFloor() -> Int
    
    func setupNewTimerIfNeeded()
    func invalidTimer()
    
    func getManager() -> ElevatorManager
}

protocol ElevatorViewInteractorOutput: class {
    func didTimerTrigger()
}
