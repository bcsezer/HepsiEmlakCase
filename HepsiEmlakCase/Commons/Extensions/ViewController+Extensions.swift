//
//  ViewController+Extensions.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 28.03.2022.
//

import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instanceFromNib<T: UIViewController>() -> T {
            return T(nibName: String(describing: self), bundle: nil)
        }
        return instanceFromNib()
    }
}
