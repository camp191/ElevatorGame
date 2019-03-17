//
//  MainViewInteractor.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 17/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import Foundation

final class MainViewInteractor: MainViewInteractorInput {
    private let elevatorManager: ElevatorManager
    
    init(elevatorManager: ElevatorManager) {
        self.elevatorManager = elevatorManager
    }
    
    func getManager() -> ElevatorManager {
        return elevatorManager
    }
    
    func invalidateTimer() {
        elevatorManager.invalidTimer()
    }
    
    func resetElevatorManagerData() {
        elevatorManager.resetManagerData()
    }
}
