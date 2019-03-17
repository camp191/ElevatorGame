//
//  ElevatorViewControllerBuilder.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 10/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

protocol ElevatorViewControllerBuildable {
    func build(with floor: Int, elevatorManager: ElevatorManager) -> UIViewController
}

final class ElevatorViewControllerBuilder: ElevatorViewControllerBuildable {
    func build(with floor: Int, elevatorManager: ElevatorManager) -> UIViewController {
        guard let viewController = try? ElevatorViewController.loadFromNib() else {
            fatalError("Could not load nib")
        }
        
        let presenter = ElevatorViewPresenter()
        let router = ElevatorViewRouter()
        let interactor = ElevatorViewInteractor(
                                floorCount: floor,
                                elevatorManager: elevatorManager)
        
        viewController.output = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.viewController = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}
