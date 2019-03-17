//
//  ElevatorViewInteractor.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 17/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import Foundation

final class ElevatorViewInteractor: ElevatorViewInteractorInput {
    private let elevatorManager: ElevatorManager
    
    init(floorCount: Int, elevatorManager: ElevatorManager) {
        self.elevatorManager = elevatorManager
        elevatorManager.setFloorCount(number: floorCount)
    }
    
    func getFloorCount() -> Int {
        return elevatorManager.floors
    }
    
    func setCurrentFloor(index: Int) {
        elevatorManager.setCurrentFloor(index: index)
    }
    
    func getCurrentFloorIndex() -> Int {
        return elevatorManager.currentElevatorFloorIndex
    }
    
    func setSelectedFloor(index: Int) {
        elevatorManager.setSelectedFloor(index: index)
    }
    
    func getSelectedFloor() -> Int {
        return elevatorManager.selectedFloorIndex
    }
}
