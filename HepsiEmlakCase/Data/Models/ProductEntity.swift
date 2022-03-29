//
//  Product.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 29.03.2022.
//

import Foundation

struct ProductEntity: Decodable {
    let id: Int?
    let name: String?
    let price: String?
    let currency: String?
    let image: String?
}
