//
//  BasketViewInteractor.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 28.03.2022.
//

import Foundation

protocol BasketViewBusinessLogic {
    func handle(request: BasketViewModels.GetBasketList.Request)
    func handle(request: BasketViewModels.TapRemove.Request)
}

class BasketViewInteractor: BasketViewBusinessLogic {
    var presenter: BasketViewPrsentationLogic?
    
    private let defaults = UserDefaults.standard
    
    func handle(request: BasketViewModels.GetBasketList.Request) {
        let basket = BasketRepository.shared.getProducts()
          
        guard let basketEntity = basket else {
            presenter?.present(response: BasketViewModels.GetBasketList.Response(basket: []))
            return
        }
        
        presenter?.present(response: BasketViewModels.GetBasketList.Response(basket: basketEntity))
    }
    
    func handle(request: BasketViewModels.TapRemove.Request) {
        BasketRepository.shared.delete(id: request.id)
        presenter?.present(response: BasketViewModels.TapRemove.Response(index: request.index))
    }
}
