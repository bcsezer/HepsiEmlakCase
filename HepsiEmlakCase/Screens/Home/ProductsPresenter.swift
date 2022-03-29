//
//  ProductsPresenter.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 27.03.2022.
//

import Foundation

protocol ProductsViewPresentationLogic {
    func present(response: ProductsModels.GetProducts.Response)
    func present(response: ProductsModels.TapAddToChart.Response)
    func present(response: ProductsModels.EmptyResult.Response)
    func present(response: ProductsModels.ProductExistError.Response)
}

class ProductsPresenter: ProductsViewPresentationLogic {
    var viewController: ProductsViewDisplayLogic?
    
    func present(response: ProductsModels.GetProducts.Response) {
        var cell = [ProductsModels.Cell]()
        
        response.products.forEach { product in
            cell.append(
                .productCell(
                    ProductsModels.Product(
                        id: product.id,
                        name: product.name,
                        price: "\(product.price ?? "") \(product.currency ?? "")",
                        image: product.image
                    )
                )
            )
        }
        viewController?.display(viewModel: ProductsModels.GetProducts.ViewModel(cell: cell))
    }
    
    func present(response: ProductsModels.TapAddToChart.Response) {
        var message = ""
        var isOutOfStock: Bool = false
        
        message = response.id == 3 ?  "Stokta Yok" : "Sepete Eklendi"
        isOutOfStock = response.id == 3
        
        viewController?.display(viewModel: ProductsModels.TapAddToChart.ViewModel(isOutOfStock: isOutOfStock, message: message))
    }
    
    func present(response: ProductsModels.EmptyResult.Response) {
        viewController?.display(viewModel: ProductsModels.EmptyResult.ViewModel(message: response.message))
    }
    
    func present(response: ProductsModels.ProductExistError.Response) {
        viewController?.display(viewModel: ProductsModels.ProductExistError.ViewModel(message: response.message))
    }
}
