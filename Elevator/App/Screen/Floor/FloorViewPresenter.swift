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
        setupCurrentFloorToNavigationBar()
    }
    
    func getTimestampCount() -> Int {
        return timestamps.count
    }
    
    func getTimestamp(index: Int) -> TimeInterval {
        return timestamps[index]
    }
    
    func setupCurrentFloorToNavigationBar() {
        view?.setCurrentFloorToNavigationBar(floor: "\((interactor?.getCurrentFloorIndex() ?? 0) + 1)")
    }
}

extension FloorViewPresenter: FloorViewInteractorOutput {
    func didTimerTrigger() {
        setupCurrentFloorToNavigationBar()
        let newTimestamp = interactor?.getSelectedFloorTimestamps(index: floor - 1) ?? []
        if timestamps.count != newTimestamp.count {
            timestamps = newTimestamp
            let newIndexPath = IndexPath(row: timestamps.count - 1, section: 0)
            view?.updateNewTimestampData(indexPath: newIndexPath)
        }
    }
}
