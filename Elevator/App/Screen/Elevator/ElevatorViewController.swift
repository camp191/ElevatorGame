//
//  ElevatorViewController.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 10/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

final class ElevatorViewController: UIViewController, NibLoader {
    typealias NibRootType = ElevatorViewController
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentFloor: UILabel!
    
    var output: ElevatorViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
        setupTableViewCell()
    }
    
    func setupTableViewCell() {
        tableView.register(
            UINib(nibName: String(describing: ElevatorCell.self), bundle: nil),
            forCellReuseIdentifier: String(describing: ElevatorCell.self))
    }
    
    @IBAction func moveToBottom(_ sender: UIButton) {
        guard let output = output else { return }
        tableView.scrollToRow(at: output.getLastFloorIndexPath(), at: .top, animated: true)
    }
    
    @IBAction func moveToTop(_ sender: UIButton) {
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}

extension ElevatorViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.selectRow(index: indexPath.row)
    }
}

extension ElevatorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output?.getFloorCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
                                withIdentifier: String(describing: ElevatorCell.self),
                                for: indexPath) as! ElevatorCell
        cell.configure(with: output?.getFloor(index: indexPath.row), delegate: self)
        return cell
    }
}

extension ElevatorViewController: ElevatorViewInput {
    func setFloorLabel(with text: String?) {
        currentFloor.text = text
    }
    
    func reloadTableViewRow(indexPaths: [IndexPath]) {
        tableView.reloadRows(at: indexPaths, with: .none)
    }
}

extension ElevatorViewController: ElevatorCellDelegate {
    func openFloor(number: Int) {
        output?.tapSelectFloor(from: number)
    }
}
