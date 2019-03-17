//
//  FloorViewControllerBuilder.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 17/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

protocol FloorViewControllerBuildable {
    func build(floor: Int, elevatorManager: ElevatorManager) -> UIViewController
}

final class FloorViewControlerBuilder: FloorViewControllerBuildable {
    func build(floor: Int, elevatorManager: ElevatorManager) -> UIViewController {
        guard let viewController = try? FloorViewController.loadFromNib() else {
            fatalError("Could not load FloorViewController")
        }
        
        let presenter = FloorViewPresenter(with: floor)
        let interactor = FloorViewInteractor(elevatorManager: elevatorManager)
        
        viewController.output = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.output = presenter
        
        return viewController
    }
}
