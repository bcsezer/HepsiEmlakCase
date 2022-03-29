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
    
    
    func showAlert(withTitle title: String, withMessage message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Tamam", style: .default, handler: { action in })
        alert.addAction(ok)
        
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
}
