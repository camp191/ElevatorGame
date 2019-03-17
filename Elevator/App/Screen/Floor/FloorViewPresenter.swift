//
//  FloorViewPresenter.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 17/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import Foundation

class FloorViewPresenter: FloorViewOutput {
    weak var view: FloorViewInput?
    var interactor: FloorViewInteractorInput?
    
    var floor: Int = 0
    var timestamps: [TimeInterval] = []
    
    init(with floor: Int) {
        self.floor = floor
    }
    
    func viewIsReady() {
        view?.setSelectedFloorToNavigationBar(floor: "\(floor)")
        timestamps = interactor?.getSelectedFloorTimestamps(index: floor - 1) ?? []
    }
    
    func getTimestampCount() -> Int {
        return timestamps.count
    }
    
    func getTimestamp(index: Int) -> TimeInterval {
        return timestamps[index]
    }
}

extension FloorViewPresenter: FloorViewInteractorOutput {
    func didTimerTrigger() {
        view?.setCurrentFloorToNavigationBar(floor: "\(interactor?.getCurrentFloorIndex() ?? 0 + 1)")
    }
}
