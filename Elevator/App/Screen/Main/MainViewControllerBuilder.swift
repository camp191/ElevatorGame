//
//  MainViewControllerBuildable.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 10/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

protocol MainViewControllerBuildable {
    func build(elevatorManager: ElevatorManager) -> UIViewController
}

final class MainVerControllerBuilder: MainViewControllerBuildable {
    func build(elevatorManager: ElevatorManager) -> UIViewController {
        guard let viewController = try? MainViewController.loadFromNib() else {
            fatalError("Could not load Main ViewController")
        }
        
        let presenter = MainViewPresenter()
        let router = MainViewRouter()
        let interactor = MainViewInteractor(elevatorManager: elevatorManager)
        
        viewController.output = presenter
        
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        
        router.viewController = viewController
        
        return viewController
    }
}
