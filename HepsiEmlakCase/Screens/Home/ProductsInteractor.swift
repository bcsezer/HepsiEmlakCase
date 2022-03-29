//
//  ProductsInteractor.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 27.03.2022.
//

import Foundation

protocol ProductsViewBusinessLogic {
    func handle(request: ProductsModels.GetProducts.Request)
    func handle(request: ProductsModels.TapAddToChart.Request)
}

class ProductsInteractor: ProductsViewBusinessLogic {
    var presenter: ProductsViewPresentationLogic?
    
    func handle(request: ProductsModels.GetProducts.Request) {
        NetworkManager.shared.getList { products in
            self.presenter?.present(response: ProductsModels.GetProducts.Response(products: products))
        } failure: { error in
            self.presenter?.present(response: ProductsModels.EmptyResult.Response(message: error))
        }
    }
    
    func handle(request: ProductsModels.TapAddToChart.Request) {
        presenter?.present(response: ProductsModels.TapAddToChart.Response())
    }
}
