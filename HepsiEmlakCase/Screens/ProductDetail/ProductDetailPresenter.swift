//
//  ProductDetailPresenter.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 7.04.2022.
//

import Foundation
import Kingfisher

protocol ProductDetailPresentationLogic {
    func presenter(present: ProductDettailModels.getDetail.Response)
}

class ProductDetailPresenter: ProductDetailPresentationLogic {
    var viewController: ProductDetailDisplayLogic?
    
    func presenter(present: ProductDettailModels.getDetail.Response) {
        viewController?.display(viewModel: ProductDettailModels.getDetail.ViewModel(image: present.image))
    }
}
