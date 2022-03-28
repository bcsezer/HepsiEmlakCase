//
//  ProductsViewControllerInteractor.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 27.03.2022.
//

import Foundation

protocol ProductsViewBusinessLogic {
    func handle(request: ProductsModels.GetProducts.Request)
}

class ProductsViewControllerInteractor: ProductsViewBusinessLogic {
    var presenter: ProductsViewPresentationLogic?
    
    func handle(request: ProductsModels.GetProducts.Request) {
        presenter?.present(response: ProductsModels.GetProducts.Response(test: request.test))
    }
}
