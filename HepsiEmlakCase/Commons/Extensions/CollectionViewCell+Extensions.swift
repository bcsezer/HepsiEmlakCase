//
//  CollectionViewCell+Extensions.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 27.03.2022.
//

import UIKit

extension UICollectionViewCell {
    
    /**
     Returns class name as identifier.
     - returns: Identifier which can be used instead of `reuseIdentifier`.
     */
    static func identifier() -> String {
        String(describing: self)
    }
    
        /**
     Registers cell automatically to given tableview.
     - parameter tableView: `UITableView`
     */
    static func registerWithNib(to collectionView: UICollectionView?) {
        collectionView?.register(UINib(nibName: identifier(), bundle: nil), forCellWithReuseIdentifier: identifier())
    }
}
