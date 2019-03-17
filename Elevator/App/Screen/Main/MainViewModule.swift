//
//  MainViewModule.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 10/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

protocol MainViewInput: class {
    func showAlert(_ alert: UIAlertController)
}

protocol MainViewOutput {
    func tapSelectFloor()
    func updateFloor(to number: String?)
    func viewDidAppear()
}

protocol MainViewRouterInput {
    func navigateToElevator(with floor: Int, elavatorManager: ElevatorManager)
}

protocol MainViewInteractorInput {
    func getManager() -> ElevatorManager
    func invalidateTimer()
    func resetElevatorManagerData()
}
