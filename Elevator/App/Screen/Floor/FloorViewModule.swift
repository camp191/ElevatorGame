//
//  FloorViewModule.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 17/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import Foundation

protocol FloorViewInput: class {
    func setCurrentFloorToNavigationBar(floor: String)
}

protocol FloorViewOutput {
    func viewIsReady()
}
