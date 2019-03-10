//
//  ElevatorViewControllerBuilder.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 10/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

protocol ElevatorViewControllerBuildable {
    func build() -> UIViewController
}

final class ElevatorViewControllerBuilder: ElevatorViewControllerBuildable {
    func build() -> UIViewController {
        guard let viewController = try? ElevatorViewController.loadFromNib() else {
            fatalError("Could not load nib")
        }
        
        return viewController
    }
}
