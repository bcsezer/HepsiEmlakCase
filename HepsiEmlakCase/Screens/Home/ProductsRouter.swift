//
//  ProductsRouter.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 28.03.2022.
//

import Foundation

import UIKit

protocol ProductsRoutingLogic {
    func routeToChart()
}

class ProductsRouter: NSObject, ProductsRoutingLogic {
    weak var viewController: ProductsViewController?

    // MARK: Routing Logic

    func routeToChart() {
        let basketVC = ViewControllerFactory.sharedInstance.makeBasketViewController()
        viewController?.navigationController?.pushViewController(basketVC, animated: true)
    }
}
