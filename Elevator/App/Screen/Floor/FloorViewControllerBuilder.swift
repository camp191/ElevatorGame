//
//  FloorViewControllerBuilder.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 17/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

protocol FloorViewControllerBuildable {
    func build(floor: Int) -> UIViewController
}

final class FloorViewControlerBuilder: FloorViewControllerBuildable {
    func build(floor: Int) -> UIViewController {
        guard let viewController = try? FloorViewController.loadFromNib() else {
            fatalError("Could not load FloorViewController")
        }
        
        let presenter = FloorViewPresenter(with: floor)
        
        viewController.output = presenter
        
        presenter.view = viewController
        
        return viewController
    }
}
