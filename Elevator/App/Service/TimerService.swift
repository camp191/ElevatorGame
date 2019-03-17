//
//  TimerService.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 17/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

protocol TimerService {
    func invalidateTimer()
    func setupTimer()
    func shouldSetupNewTimer()
    func setup(delegate: TimerServiceDelegate)
}

protocol TimerServiceDelegate: class {
    func trigger()
}

final class TimerServiceImplementation: TimerService {
    var timer = Timer()
    var isTimerValidate = false
    
    weak var delegate: TimerServiceDelegate?
    
    func setup(delegate: TimerServiceDelegate) {
        self.delegate = delegate
    }
    
    func invalidateTimer() {
        timer.invalidate()
        isTimerValidate = false
    }

    func shouldSetupNewTimer() {
        if !isTimerValidate {
            setupTimer()
        }
    }
    
    func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(triggerTimer), userInfo: nil, repeats: true)
        isTimerValidate = true
    }
    
    @objc func triggerTimer() {
        delegate?.trigger()
    }
}
