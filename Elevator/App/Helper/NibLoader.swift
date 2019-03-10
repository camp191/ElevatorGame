//
//  NibLoader.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 10/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

struct CountNotLoadNib: Error { }

protocol NibLoader {
    associatedtype NibRootType
    static func loadFromNib() throws -> NibRootType
}

extension NibLoader where NibRootType: UIView {
    static func loadFromNib() throws -> NibRootType {
        let nibName = String(describing: self)
        let bundle = Bundle(for: NibRootType.self)
        guard let firstElement = bundle.loadNibNamed(nibName, owner: nil, options: nil)?.first as? NibRootType else {
            throw CountNotLoadNib()
        }
        return firstElement
    }
}

extension NibLoader where NibRootType: UIViewController {
    static func loadFromNib() throws -> NibRootType {
        let nibName = String(describing: self)
        let bundle = Bundle(for: NibRootType.self)
        let viewController = NibRootType(nibName: nibName, bundle: bundle)
        return viewController
    }
}
