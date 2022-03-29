//
//  ProductsModels.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 27.03.2022.
//

import Foundation

enum ProductsModels {
    
    // Use Cases
    struct Product {
        let id: Int?
        let name: String?
        let price: String?
        let currency: String?
        let image: String?
    }
    
    enum GetProducts {
        struct Request { }
        struct Response {
            let products: [ProductEntity]
        }
        struct ViewModel {
            let cell: [Cell]
        }
    }
    
    enum EmptyResult {
        struct Response {
            let message: String
        }
        struct ViewModel {
            let message: String
        }
    }
    
    enum TapAddToChart {
        struct Request { }
        struct Response { }
        struct ViewModel {
            let message: String
        }
    }
    
    enum Cell {
        case productCell(Product)
        
        func identifier() -> String {
            switch self {
            case.productCell:
                return ProductCell.identifier
            }
        }
    }
}
