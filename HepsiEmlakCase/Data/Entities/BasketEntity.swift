//
//  BasketEntity.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 29.03.2022.
//

import Foundation

struct BasketEntity: Codable {
    let id: Int
    let name: String
    var price: String
    let image: String
    let currency: String
    var count: Int
}
