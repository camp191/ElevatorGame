//
//  FloorViewInteractor.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 17/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import Foundation

final class FloorViewInteractor: FloorViewInteractorInput {
    private let elevatorManager: ElevatorManager
    weak var output: FloorViewInteractorOutput?
    
    init(elevatorManager: ElevatorManager) {
        self.elevatorManager = elevatorManager
        elevatorManager.add(subscriber: self)
    }
    
    func getCurrentFloorIndex() -> Int {
        return elevatorManager.currentElevatorFloorIndex
    }
    
    func getSelectedFloorTimestamps(index: Int) -> [TimeInterval] {
        return elevatorManager.floorTimeStampFromIndex[index] ?? []
    }
}

extension FloorViewInteractor: ElevatorManagerSubscribe {
    func trigger() {
        output?.didTimerTrigger()
    }
}
