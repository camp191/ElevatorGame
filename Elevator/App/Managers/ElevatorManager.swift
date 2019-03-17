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
    var subscribers: [ElevatorManagerSubscribe] { get }
    
    func add(subscriber: ElevatorManagerSubscribe)
    
    func setFloorCount(number: Int)
    func setCurrentFloor(index: Int)
    func setSelectedFloor(index: Int)
    
    func setupTimerIfNeeded()
    func invalidTimer()
}

protocol ElevatorManagerSubscribe: class {
    func trigger()
}

struct ElevatorManagerSubscriber {
    weak var subscriber: ElevatorManagerSubscribe?
    init (subscriber: ElevatorManagerSubscribe) {
        self.subscriber = subscriber
    }
}

final class ElevatorManagerImplementation: ElevatorManager {
    private(set) var floors: Int = 0
    private(set) var currentElevatorFloorIndex: Int = 0
    private(set) var selectedFloorIndex: Int = 0
    private(set) var floorTimeStampFromIndex: [Int: [TimeInterval]] = [:]
    
    private let timerService: TimerService
    
    private(set) var subscribers: [ElevatorManagerSubscribe] = []

    init(timerService: TimerService) {
        self.timerService = timerService
        timerService.setup(delegate: self)
    }
    
    func add(subscriber: ElevatorManagerSubscribe) {
        subscribers.append(subscriber)
    }
    
    func setFloorCount(number: Int) {
        floors = number
    }
    
    func setCurrentFloor(index: Int) {
        currentElevatorFloorIndex = index
    }
    
    func setSelectedFloor(index: Int) {
        selectedFloorIndex = index
    }
    
    func setupTimerIfNeeded() {
        timerService.shouldSetupNewTimer()
    }
    
    func invalidTimer() {
        timerService.invalidateTimer()
    }
}

extension ElevatorManagerImplementation: TimerServiceDelegate {
    func trigger() {
        subscribers.forEach { (subscriber) in
            subscriber.trigger()
        }
    }
}
