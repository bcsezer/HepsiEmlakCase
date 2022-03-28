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
}

struct ViewControllerFactory: ViewControllerFactoryProtocol {
    static let sharedInstance = ViewControllerFactory()
    
    func makeProductsViewController() -> UIViewController {
        let viewController = ProductsViewController(nibName: "ProductsViewController", bundle: nil)
        let interactor = ProductsViewControllerInteractor()
        let presenter = ProductsViewControllerPresenter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        return viewController
    }
}
