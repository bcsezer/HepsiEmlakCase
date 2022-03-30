//
//  BasketViewPresenter.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 28.03.2022.
//

import Foundation

protocol BasketViewPrsentationLogic {
    func present(response: BasketViewModels.GetBasketList.Response)
    func present(response: BasketViewModels.TapRemove.Response)
    func present(response: BasketViewModels.TapIncrease.Response)
    func present(response: BasketViewModels.TapDecrease.Response)
}

class BasketViewPresenter: BasketViewPrsentationLogic {
    var viewController: BasketViewDisplayLogic?
    
    func present(response: BasketViewModels.GetBasketList.Response) {
        var cell: [BasketViewModels.BasketViewCell] = []
        
        for (i, basket) in response.basket.enumerated() {
            cell.append(
                .basketCell(
                    BasketViewModels.BasketModel(
                        id: basket.id,
                        name: basket.name,
                        price: "\(basket.price) \(basket.currency)",
                        image: basket.image,
                        index: i
                    )
                )
            )
        }
        viewController?.display(viewModel: BasketViewModels.GetBasketList.ViewModel(cell: cell))
    }
    
    func present(response: BasketViewModels.TapRemove.Response) {
        let indexPath = IndexPath(row: response.index, section: 0)
        viewController?.display(viewModel: BasketViewModels.TapRemove.ViewModel(indexPath: indexPath))
    }
    
    func present(response: BasketViewModels.TapDecrease.Response) {
        viewController?.display(viewModel: BasketViewModels.TapDecrease.ViewModel())
    }
    
    func present(response: BasketViewModels.TapIncrease.Response) {
        viewController?.display(viewModel: BasketViewModels.TapIncrease.ViewModel())
    }
}
