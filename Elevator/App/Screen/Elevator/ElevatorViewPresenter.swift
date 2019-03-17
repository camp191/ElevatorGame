//
//  ElevatorViewPresenter.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 10/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

final class ElevatorViewPresenter: ElevatorViewOutput {
    weak var view: ElevatorViewInput?
    
    var floors: Int = 0
    var currentElevatorFloorIndex: Int = 0
    var selectedFloorIndex: Int = 0
    
    var timer = Timer()
    var isTimerValidate = false
    
    init(with floor: Int) {
        self.floors = floor
    }
    
    func viewIsReady() {
        view?.setFloorLabel(with: "\(currentElevatorFloorIndex + 1)")
    }
    
    func getFloorCount() -> Int {
        return floors
    }
    
    func getFloor(index: Int) -> Floor {
        let floorNumber = index + 1
        let isArrive = index == currentElevatorFloorIndex
        let isSelected = index == selectedFloorIndex && selectedFloorIndex != currentElevatorFloorIndex
        
        return Floor(number: floorNumber, isSelected: isSelected, isArrived: isArrive)
    }
    
    func getCurrentElevatorFloor() -> String {
        return "\(currentElevatorFloorIndex)"
    }
    
    func getLastFloorIndexPath() -> IndexPath {
        return IndexPath(row: floors - 1, section: 0)
    }
    
    func invalidateTimer() {
        timer.invalidate()
        isTimerValidate = false
    }
    
    func selectRow(index: Int) {
        var indexPathsToReload: [IndexPath] = []
        indexPathsToReload.append(IndexPath(row: selectedFloorIndex, section: 0))
        
        selectedFloorIndex = index
        indexPathsToReload.append(IndexPath(row: selectedFloorIndex, section: 0))
        
        view?.reloadTableViewRow(indexPaths: indexPathsToReload)
        shouldSetupNewTimer()
    }
    
    @objc func updateElevator() {
        var indexPathsToReload: [IndexPath] = []
        
        indexPathsToReload.append(IndexPath(row: currentElevatorFloorIndex, section: 0))
        
        setCurrentFloorIndex()
        
        indexPathsToReload.append(IndexPath(row: currentElevatorFloorIndex, section: 0))
        
        view?.setFloorLabel(with: "\(currentElevatorFloorIndex + 1)")
        view?.reloadTableViewRow(indexPaths: indexPathsToReload)
    }
    
    func setCurrentFloorIndex() {
        if currentElevatorFloorIndex == selectedFloorIndex {
            invalidateTimer()
        }
        else if currentElevatorFloorIndex > selectedFloorIndex {
            currentElevatorFloorIndex -= 1
        }
        else if currentElevatorFloorIndex < selectedFloorIndex {
            currentElevatorFloorIndex += 1
        }
    }
    
    func shouldSetupNewTimer() {
        if !isTimerValidate {
            setupTimer()
        }
    }
    
    func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateElevator), userInfo: nil, repeats: true)
        isTimerValidate = true
    }
}
