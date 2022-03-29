//
//  BasketRouter.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 28.03.2022.
//

import Foundation

protocol BasketRoutingLogic {
    func routeToBack()
}

class BasketRouter: BasketRoutingLogic {
    weak var viewController: BasketViewController?
    
    func routeToBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
