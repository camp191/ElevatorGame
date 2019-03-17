//
//  ElevatorViewRouter.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 17/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

final class ElevatorViewRouter: ElevatorRouterInput {
    weak var viewController: UIViewController?
    
    let elevatorBuilder: ElevatorViewControllerBuildable
    
    init(elevatorBuilder: ElevatorViewControllerBuildable = ElevatorViewControllerBuilder()) {
        self.elevatorBuilder = elevatorBuilder
    }
    
    func navigate(to floor: Int, elevatorManager: ElevatorManager) {
        let floorVC = FloorViewControlerBuilder().build(floor: floor, elevatorManager: elevatorManager)
        viewController?.navigationController?.pushViewController(floorVC, animated: true)
    }
}
