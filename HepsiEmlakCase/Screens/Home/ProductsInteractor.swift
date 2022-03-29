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
        let isDasketContainsProduct = BasketRepository.shared.checkProductIsInBasket(request.selectedProduct)
        
        if !isDasketContainsProduct  && request.selectedProduct.id != 3{
            BasketRepository.shared.addProduct(request.selectedProduct)
            
            presenter?.present(
                response: ProductsModels.TapAddToChart.Response(
                    id: request.selectedProduct.id ?? 0
                )
            )
        } else if request.selectedProduct.id == 3{
            presenter?.present(
                response: ProductsModels.TapAddToChart.Response(
                    id: request.selectedProduct.id ?? 0
                )
            )
        } else {
            presenter?.present(response: ProductsModels.ProductExistError.Response(message: "Seçili Ürün Daha Önce Sepete Eklendi."))
        }
    }
}
