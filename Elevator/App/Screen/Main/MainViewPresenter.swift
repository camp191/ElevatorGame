//
//  MainViewPresenter.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 10/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

final class MainViewPresenter: MainViewOutput {
    weak var view: MainViewInput?
    var router: MainViewRouterInput?
    var interactor: MainViewInteractorInput?
    
    private var floorNumber: Int?
    
    func tapSelectFloor() {
        guard let floorNumber = floorNumber else {
            let alert = UIAlertController(title: "Error", message: "ใส่จำนวนชั้นให้ถูกต้อง", preferredStyle: .alert)
            let action = UIAlertAction(title: "เค", style: .default, handler: nil)
            alert.addAction(action)
            view?.showAlert(alert)
            return
        }
        guard let elevatorManager = interactor?.getManager() else { return }
        router?.navigateToElevator(with: floorNumber, elavatorManager: elevatorManager)
    }
    
    func updateFloor(to number: String?) {
        guard let numberString = number else {
            floorNumber =  nil
            return
        }
        
        guard let floor = Int(numberString) else {
            floorNumber = nil
            return
        }
        
        if floor == 0 {
            floorNumber = nil
            return
        }
        
        floorNumber = floor
    }
    
    func viewDidAppear() {
        interactor?.invalidateTimer()
        interactor?.resetElevatorManagerData()
    }
}
