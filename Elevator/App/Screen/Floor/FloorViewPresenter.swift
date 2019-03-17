//
//  FloorViewPresenter.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 17/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import Foundation

class FloorViewPresenter: FloorViewOutput {
    weak var view: FloorViewInput?
    
    var floor: Int = 0
    
    init(with floor: Int) {
        self.floor = floor
    }
    
    func viewIsReady() {
        view?.setCurrentFloorToNavigationBar(floor: "\(floor)")
    }
}
