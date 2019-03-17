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
    
    weak var output: ElevatorViewInteractorOutput?
    
    init(floorCount: Int, elevatorManager: ElevatorManager) {
        self.elevatorManager = elevatorManager
        elevatorManager.setFloorCount(number: floorCount)
        elevatorManager.add(subscriber: self)
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
    
    func setupNewTimerIfNeeded() {
        elevatorManager.setupTimerIfNeeded()
    }
    
    func invalidTimer() {
        elevatorManager.invalidTimer()
    }
}

extension ElevatorViewInteractor: ElevatorManagerSubscribe {
    func trigger() {
        output?.didTimerTrigger()
    }
}
