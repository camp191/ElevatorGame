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
    
    private var floorNumber: Int?
    
    func tapSelectFloor() {
        guard floorNumber != nil else {
            let alert = UIAlertController(title: "Error", message: "ใส่จำนวนชั้นให้ถูกต้อง", preferredStyle: .alert)
            let action = UIAlertAction(title: "เค", style: .default, handler: nil)
            alert.addAction(action)
            view?.showAlert(alert)
            return
        }
        router?.navigateToElevator()
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
}
