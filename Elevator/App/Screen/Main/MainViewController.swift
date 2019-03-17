//
//  MainViewController.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 10/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController, NibLoader {
    typealias NibRootType = MainViewController
    
    @IBOutlet weak var tfFloor: UITextField!
    
    var output: MainViewOutput?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output?.viewDidAppear()
    }
    
    @IBAction func tapSelectFloor(_ sender: UIButton) {
        output?.tapSelectFloor()
    }
    
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        output?.updateFloor(to: tfFloor.text)
    }
}

extension MainViewController: MainViewInput {
    func showAlert(_ alert: UIAlertController) {
        present(alert, animated: true) {
            self.tfFloor.text = nil
        }
    }
}
