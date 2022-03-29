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
}

class ProductsPresenter: ProductsViewPresentationLogic {
    var viewController: ProductsViewDisplayLogic?
    var cell = [ProductsModels.Cell]()
    
    func present(response: ProductsModels.GetProducts.Response) {
        response.products.forEach { product in
            cell.append(
                .productCell(
                    ProductsModels.Product(
                        id: product.id,
                        name: product.name,
                        price: product.price,
                        currency: product.currency,
                        image: product.image
                    )
                )
            )
        }
        viewController?.display(viewModel: ProductsModels.GetProducts.ViewModel(cell: cell))
    }
    
    func present(response: ProductsModels.TapAddToChart.Response) {
        viewController?.display(viewModel: ProductsModels.TapAddToChart.ViewModel(message: "Sepete Eklendi"))
    }
    
    func present(response: ProductsModels.EmptyResult.Response) {
        viewController?.display(viewModel: ProductsModels.EmptyResult.ViewModel(message: response.message))
    }
}
