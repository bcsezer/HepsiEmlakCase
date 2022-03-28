//
//  BasketViewInteractor.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 28.03.2022.
//

import Foundation

protocol BasketViewBusinessLogic {
    func handle(request: BasketViewModels.GetBasketList.Request)
}

class BasketViewInteractor: BasketViewBusinessLogic {
    var presenter: BasketViewPrsentationLogic?
    
    func handle(request: BasketViewModels.GetBasketList.Request) {
        
    }
}
