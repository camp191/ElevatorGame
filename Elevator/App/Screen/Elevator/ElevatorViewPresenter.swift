//
//  ElevatorViewPresenter.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 10/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

struct Floor {
    var number: Int
    var isSelected: Bool
    var isArrived: Bool
}

final class ElevatorViewPresenter: ElevatorViewOutput {
    weak var view: ElevatorViewInput?
    
    var floors: [Floor] = []
    var currentElevatorFloorIndex: Int = 0
    var selectedFloorIndex: Int = 0
    
    var timer = Timer()
    var isTimerValidate = false
    
    init(with floor: Int) {
        for num in 1...floor {
            floors.append(
                Floor(number: num, isSelected: false, isArrived: num == 1)
            )
        }
    }
    
    func getFloorCount() -> Int {
        return floors.count
    }
    
    func getFloor(index: Int) -> Floor {
        return floors[index]
    }
    
    func getCurrentElevatorFloor() -> String {
        return "\(currentElevatorFloorIndex)"
    }
    
    func getLastFloorIndexPath() -> IndexPath {
        return IndexPath(row: floors.count - 1, section: 0)
    }
    
    func invalidateTimer() {
        timer.invalidate()
        isTimerValidate = false
    }
    
    func selectRow(index: Int) {
        var indexPathsToReload: [IndexPath] = []
        setupFloorDataToArray(index: selectedFloorIndex, floorData: floors[selectedFloorIndex], isSelected: false, isArrived: nil)
        indexPathsToReload.append(IndexPath(row: selectedFloorIndex, section: 0))
        
        selectedFloorIndex = index
        setupFloorDataToArray(index: selectedFloorIndex, floorData: floors[selectedFloorIndex], isSelected: true, isArrived: nil)
        indexPathsToReload.append(IndexPath(row: selectedFloorIndex, section: 0))
        
        view?.reloadTableViewRow(indexPaths: indexPathsToReload)
        shouldSetupNewTimer()
    }
    
    @objc func updateElevator() {
        var indexPathsToReload: [IndexPath] = []
        
        setupFloorDataToArray(index: currentElevatorFloorIndex, floorData: floors[currentElevatorFloorIndex], isSelected: nil, isArrived: false)
        indexPathsToReload.append(IndexPath(row: currentElevatorFloorIndex, section: 0))
        
        if currentElevatorFloorIndex == selectedFloorIndex {
            invalidateTimer()
        }
        else if currentElevatorFloorIndex > selectedFloorIndex {
            currentElevatorFloorIndex -= 1
        }
        else if currentElevatorFloorIndex < selectedFloorIndex {
            currentElevatorFloorIndex += 1
        }
        
        setupFloorDataToArray(index: currentElevatorFloorIndex, floorData: floors[currentElevatorFloorIndex], isSelected: nil, isArrived: true)
        indexPathsToReload.append(IndexPath(row: currentElevatorFloorIndex, section: 0))
        
        view?.reloadTableViewRow(indexPaths: indexPathsToReload)
    }
    
    func setupFloorDataToArray(index: Int, floorData: Floor, isSelected: Bool? = nil, isArrived: Bool? = nil) {
        let isSelect = isSelected != nil ? isSelected! : floorData.isSelected
        let isArrive = isArrived != nil ? isArrived! : floorData.isArrived
        floors[index] = Floor(number: floorData.number, isSelected: isSelect, isArrived: isArrive)
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
