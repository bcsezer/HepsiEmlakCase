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
        struct Request {
            let test: String
        }
        struct Response {
            let test: String
        }
        struct ViewModel {
            let test: String
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
