//
//  FloorViewModule.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 17/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import Foundation

protocol FloorViewInput: class {
    func setSelectedFloorToNavigationBar(floor: String)
    func setCurrentFloorToNavigationBar(floor: String)
    func updateNewTimestampData(indexPath: IndexPath)
}

protocol FloorViewOutput {
    func viewIsReady()
    func getTimestampCount() -> Int
    func getTimestamp(index: Int) -> TimeInterval
}

protocol FloorViewInteractorInput {
    func getCurrentFloorIndex() -> Int
    func getSelectedFloorTimestamps(index: Int) -> [TimeInterval]
}

protocol FloorViewInteractorOutput: class {
    func didTimerTrigger()
}
