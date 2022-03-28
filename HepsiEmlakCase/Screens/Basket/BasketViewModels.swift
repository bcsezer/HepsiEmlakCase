//
//  BasketViewModels.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 28.03.2022.
//

import Foundation

enum BasketViewModels {
    
    enum GetBasketList {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
            let cell: [BasketViewCell]
        }
    }
    
    enum BasketViewCell {
        case headerCell
        case basketCell
        
        func identifier() -> String {
            switch self {
            case.headerCell:
                return BasketCell.identifier
            case .basketCell:
                return BasketHeaderCell.identifier
            }
        }
    }
}
