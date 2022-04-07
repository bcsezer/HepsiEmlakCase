//
//  ProductDetailModels.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 7.04.2022.
//

import Foundation
import UIKit

enum ProductDettailModels {
    
    enum getDetail{
        struct Request {
        }
        struct Response {
            let image: String
        }
        struct ViewModel {
            let image: String
        }
    }
}
