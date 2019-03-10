//
//  RootRouter.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 10/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

protocol RootRouter {
    func rootToMainScreen()
}

final class RootRouterImplementation: RootRouter {
    private let mainWindow: UIWindow?
    private let rootDispatcher: RootDispatcher
    
    init(mainWindow: UIWindow?, rootDispatcher: RootDispatcher = RootDispatcherImplementation()) {
        self.mainWindow = mainWindow
        self.rootDispatcher = rootDispatcher
    }
    
    func rootToMainScreen() {
        mainWindow?.rootViewController = rootDispatcher.mainFlow()
    }
}
