//
//  ProductsViewControllerPresenter.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 27.03.2022.
//

import Foundation

protocol ProductsViewPresentationLogic {
    func present(response: ProductsModels.GetProducts.Response)
}

class ProductsViewControllerPresenter: ProductsViewPresentationLogic {
    var viewController: ProductsViewDisplayLogic?
    
    func present(response: ProductsModels.GetProducts.Response) {
        viewController?.display(viewModel: ProductsModels.GetProducts.ViewModel(test: response.test))
    }
}
