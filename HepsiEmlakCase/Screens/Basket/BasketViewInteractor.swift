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
    func handle(request: BasketViewModels.TapIncrease.Request)
    func handle(request: BasketViewModels.TapDecrease.Request)
    func handle(request: BasketViewModels.TapPlaceOrder.Request)
}

class BasketViewInteractor: BasketViewBusinessLogic {
    var presenter: BasketViewPrsentationLogic?
    
    private let defaults = UserDefaults.standard
    
    func handle(request: BasketViewModels.GetBasketList.Request) {
        let basket = BasketRepository.shared.getProducts() ?? []
        presenter?.present(response: BasketViewModels.GetBasketList.Response(basket: basket))
    }
    
    func handle(request: BasketViewModels.TapRemove.Request) {
        BasketRepository.shared.delete(id: request.id)
        presenter?.present(response: BasketViewModels.TapRemove.Response(index: request.index))
    }
    
    func handle(request: BasketViewModels.TapIncrease.Request) {
        print(BasketRepository.shared.increaseAmount(selectedProductId: request.id))
        presenter?.present(response: BasketViewModels.TapIncrease.Response(index: request.index))
    }
    
    func handle(request: BasketViewModels.TapDecrease.Request) {
        print(BasketRepository.shared.decreaseAmount(selectedProductId: request.id))
        presenter?.present(response: BasketViewModels.TapDecrease.Response(index: request.index))
    }
    
    func handle(request: BasketViewModels.TapPlaceOrder.Request) {

    }
}
