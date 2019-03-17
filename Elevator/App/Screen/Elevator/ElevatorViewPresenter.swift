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
    var router: ElevatorRouterInput?
    var interactor: ElevatorViewInteractorInput?
    
    var timer = Timer()
    var isTimerValidate = false
    
    func viewIsReady() {
        view?.setFloorLabel(with: "\(interactor?.getCurrentFloorIndex() ?? 0 + 1)")
    }
    
    func tapSelectFloor(from floorIndex: Int) {
        router?.navigate(to: floorIndex)
    }
    
    func getFloorCount() -> Int {
        return interactor?.getFloorCount() ?? 0
    }
    
    func getFloor(index: Int) -> Floor {
        let floorNumber = index + 1
        let selectedFloorIndex = interactor?.getSelectedFloor() ?? 0
        let currentFloorIndex = interactor?.getCurrentFloorIndex() ?? 0
        
        let isArrive = index == currentFloorIndex
        let isSelected = index ==  selectedFloorIndex && selectedFloorIndex != currentFloorIndex
        
        return Floor(number: floorNumber, isSelected: isSelected, isArrived: isArrive)
    }
    
    func getCurrentElevatorFloor() -> String {
        return "\(interactor?.getCurrentFloorIndex() ?? 0)"
    }
    
    func getLastFloorIndexPath() -> IndexPath {
        let floorCount = interactor?.getFloorCount() ?? 0
        return IndexPath(row: floorCount - 1, section: 0)
    }
    
    func invalidateTimer() {
        timer.invalidate()
        isTimerValidate = false
    }
    
    func selectRow(index: Int) {
        var indexPathsToReload: [IndexPath] = []
        indexPathsToReload.append(IndexPath(row: interactor?.getSelectedFloor() ?? 0, section: 0))
        
        interactor?.setSelectedFloor(index: index)
        indexPathsToReload.append(IndexPath(row: interactor?.getSelectedFloor() ?? 0, section: 0))
        
        view?.reloadTableViewRow(indexPaths: indexPathsToReload)
        shouldSetupNewTimer()
    }
    
    @objc func updateElevator() {
        var indexPathsToReload: [IndexPath] = []
        
        indexPathsToReload.append(IndexPath(row: interactor?.getCurrentFloorIndex() ?? 0, section: 0))
        
        setCurrentFloorIndex()
        
        indexPathsToReload.append(IndexPath(row: interactor?.getCurrentFloorIndex() ?? 0, section: 0))
        
        view?.setFloorLabel(with: "\(interactor?.getCurrentFloorIndex() ?? 0 + 1)")
        view?.reloadTableViewRow(indexPaths: indexPathsToReload)
    }
    
    func setCurrentFloorIndex() {
        let currentElevatorFloorIndex = interactor?.getCurrentFloorIndex() ?? 0
        let selectedFloorIndex = interactor?.getSelectedFloor() ?? 0
        if currentElevatorFloorIndex == selectedFloorIndex {
            invalidateTimer()
        }
        else if currentElevatorFloorIndex > selectedFloorIndex {
            interactor?.setCurrentFloor(index: currentElevatorFloorIndex - 1)
        }
        else if currentElevatorFloorIndex < selectedFloorIndex {
            interactor?.setCurrentFloor(index: currentElevatorFloorIndex + 1)
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
