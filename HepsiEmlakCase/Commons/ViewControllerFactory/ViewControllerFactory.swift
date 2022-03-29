//
//  ViewControllerFactory.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 27.03.2022.
//

import Foundation
import UIKit

protocol ViewControllerFactoryProtocol {
    func makeProductsViewController() -> UIViewController
    func makeBasketViewController() -> UIViewController
}

struct ViewControllerFactory: ViewControllerFactoryProtocol {
    static let sharedInstance = ViewControllerFactory()
    
    func makeProductsViewController() -> UIViewController {
        let viewController = ProductsViewController(nibName: "ProductsViewController", bundle: nil)
        let interactor = ProductsInteractor()
        let presenter = ProductsPresenter()
        let router = ProductsRouter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        router.viewController = viewController
        viewController.router = router
        
        return viewController
    }
    
    func makeBasketViewController() -> UIViewController {
        let viewController = BasketViewController(nibName: "BasketViewController", bundle: nil)
        let interactor = BasketViewInteractor()
        let presenter = BasketViewPresenter()
        let router = BasketRouter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
    
        return viewController
    }
}
