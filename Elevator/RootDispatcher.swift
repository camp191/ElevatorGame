//
//  RootDispatcher.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 10/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

protocol RootDispatcher {
    func mainFlow() -> UIViewController
}

final class RootDispatcherImplementation: RootDispatcher {
    func mainFlow() -> UIViewController {
        let mainViewController = MainVerControllerBuilder().build(
                                        elevatorManager: ElevatorManagerImplementation(timerService: TimerServiceImplementation()))
        let navigationController = UINavigationController(
            rootViewController: mainViewController
        )
        return navigationController
    }
}
