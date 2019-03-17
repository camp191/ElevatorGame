//
//  FloorViewController.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 17/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

final class FloorViewController: UIViewController, NibLoader {
    typealias NibRootType = FloorViewController
    
    @IBOutlet weak var tableView: UITableView!
    
    var output: FloorViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
        setupTableViewCell()
    }
    
    func setupTableViewCell() {
        tableView.register(
            UINib(nibName: String(describing: FloorCell.self), bundle: nil),
            forCellReuseIdentifier: String(describing: FloorCell.self))
    }
}

extension FloorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FloorCell.self), for: indexPath) as! FloorCell
        cell.configure(index: indexPath.row, timeStamp: output?.getTimestamp(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output?.getTimestampCount() ?? 0
    }
}

extension FloorViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}

extension FloorViewController: FloorViewInput {
    func setCurrentFloorToNavigationBar(floor: String) {
        navigationItem.title = floor
    }
    
    func setSelectedFloorToNavigationBar(floor: String) {
        navigationItem.rightBarButtonItem = UIBarButtonItem()
        navigationItem.rightBarButtonItem?.title = floor
    }
}
