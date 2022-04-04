//
//  BasketViewModels.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 28.03.2022.
//

import Foundation

enum BasketViewModels {
    
    struct BasketModel {
        let id: Int
        let name: String
        let price: String
        let image: String
        let index: Int
        let count: Int
    }
    
    struct EmptyList {
        struct Request {
        }
        struct Response {
            
        }
        struct ViewModel {
            let cell: [BasketViewCell]
        }
    }
    
    enum GetBasketList {
        struct Request {
        }
        struct Response {
            let basket: [BasketEntity]
        }
        struct ViewModel {
            let totalPrice: String
            let cell: [BasketViewCell]
        }
    }
    
    enum TapRemove {
        struct Request {
            let index: Int
            let id: Int
        }
        struct Response {
            let index: Int
        }
        struct ViewModel {
            let indexPath: IndexPath
        }
    }
    
    enum TapDecrease {
        struct Request {
            let id: Int
            let index: Int
        }
        struct Response {
            let index: Int
        }
        struct ViewModel {
            let product: BasketModel
        }
    }
    
    enum TapIncrease {
        struct Request {
            let id: Int
            let index: Int
        }
        struct Response {
            let index: Int
        }
        struct ViewModel {
            let product: BasketModel
        }
    }
    
    enum TapPlaceOrder {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
        }
    }
    
    enum BasketViewCell {
        case basketCell(BasketModel)
        case emptyCell
        
        func identifier() -> String {
            switch self {
            case .basketCell:
                return BasketCell.identifier
            case .emptyCell:
                return EmptyBasketCell.identifier
            }
        }
    }
}
