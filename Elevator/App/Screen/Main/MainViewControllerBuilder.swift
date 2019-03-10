//
//  MainViewControllerBuildable.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 10/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

protocol MainViewControllerBuildable {
    func build() -> UIViewController
}

final class MainVerControllerBuilder: MainViewControllerBuildable {
    func build() -> UIViewController {
        guard let viewController = try? MainViewController.loadFromNib() else {
            fatalError("Could not load Main ViewController")
        }
        
        let presenter = MainViewPresenter()
        let router = MainViewRouter()
        
        viewController.output = presenter
        
        presenter.router = router
        presenter.view = viewController
        
        router.viewController = viewController
        
        return viewController
    }
}
