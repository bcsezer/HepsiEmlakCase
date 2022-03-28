//
//  BasketViewPresenter.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 28.03.2022.
//

import Foundation

protocol BasketViewPrsentationLogic {
    func present(response: BasketViewModels.GetBasketList.Response)
}

class BasketViewPresenter: BasketViewPrsentationLogic {
    var viewController: BasketViewDisplayLogic?
    
    func present(response: BasketViewModels.GetBasketList.Response) {
        
    }
}
