//
//  AppDelegateHelper.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 10/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

protocol AppDelegateHelper {
    func rootToMainScreen()
}

final class AppDelegateHelperImplementation: AppDelegateHelper {
    private let mainWindow: UIWindow?
    private let rootRouter: RootRouter
    
    init(mainWindow: UIWindow?, rootRouter: RootRouter) {
        self.mainWindow = mainWindow
        self.rootRouter = rootRouter
    }
    
    func rootToMainScreen() {
        rootRouter.rootToMainScreen()
    }
}
