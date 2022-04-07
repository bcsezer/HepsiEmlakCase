//
//  ProductDetailInteractor.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 7.04.2022.
//

import Foundation

protocol ProductsDetailBusinessLogic {
    func handle(request: ProductDettailModels.getDetail.Request)
}

class ProductDetailInteractor: ProductsDetailBusinessLogic {
    var presenter: ProductDetailPresentationLogic?
    
    var image: String?
    
    func handle(request: ProductDettailModels.getDetail.Request) {
        
        guard let productImage = self.image else { return }
        
        presenter?.presenter(present: ProductDettailModels.getDetail.Response(image: productImage))
    }
}
