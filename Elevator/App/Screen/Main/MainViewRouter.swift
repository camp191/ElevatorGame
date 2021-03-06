//
//  MainViewRouter.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 10/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

final class MainViewRouter: MainViewRouterInput {
    weak var viewController: UIViewController?
    
    let elevatorBuilder: ElevatorViewControllerBuildable
    
    init(elevatorBuilder: ElevatorViewControllerBuildable = ElevatorViewControllerBuilder()) {
        self.elevatorBuilder = elevatorBuilder
    }
    
    func navigateToElevator(with floor: Int, elavatorManager: ElevatorManager) {
        let elevatorVC = ElevatorViewControllerBuilder().build(with: floor, elevatorManager: elavatorManager)
        viewController?.navigationController?.pushViewController(elevatorVC, animated: true)
    }
}
