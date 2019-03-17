//
//  ElevatorManager.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 17/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import Foundation

protocol ElevatorManager {
    var floors: Int { get }
    var currentElevatorFloorIndex: Int { get }
    var selectedFloorIndex: Int { get }
    var floorTimeStampFromIndex: [Int: [TimeInterval]] { get }
    
    func setFloorCount(number: Int)
    func setCurrentFloor(index: Int)
    func setSelectedFloor(index: Int)
}

final class ElevatorManagerImplementation: ElevatorManager {
    private(set) var floors: Int = 0
    private(set) var currentElevatorFloorIndex: Int = 0
    private(set) var selectedFloorIndex: Int = 0
    private(set) var floorTimeStampFromIndex: [Int: [TimeInterval]] = [:]
//
//    init(timerService: TimerService) {
//
//    }
    
    func setFloorCount(number: Int) {
        floors = number
    }
    
    func setCurrentFloor(index: Int) {
        currentElevatorFloorIndex = index
    }
    
    func setSelectedFloor(index: Int) {
        selectedFloorIndex = index
    }
}
//
//final class TimerService {
//    
//}
