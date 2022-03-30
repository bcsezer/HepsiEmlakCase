//
//  BasketRepository .swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 29.03.2022.
//

import Foundation
import UIKit

struct BasketRepository {
    static var shared = BasketRepository()
    
    let defaults = UserDefaults.standard
    var basketEntity: [BasketEntity] = []
    var count = 1
    
    //Arttırma fonksiyonu
    mutating func increaseAmount(selectedProductId: Int) -> [BasketEntity] {
        
        var basket = getProducts()
        
        let productPrice = basket?.first(where: {$0.id == selectedProductId})?.price
        
        let stringPrice = productPrice?.replacingOccurrences(of: "TRY", with: "").replacingOccurrences(of: " ", with: "")
        count += 1
        
        let firstPrice = stringPrice?.stringToFloat() ?? 0.0
        let lastPrice = (firstPrice * CGFloat(count)).description
        
        if let index = basket?.firstIndex(where: {$0.id == selectedProductId}) {
            basket?[index].price = "\(lastPrice) TRY"
        }
        
        return basket ?? []
    }
    
    //Azaltma Fonksiyonu
    mutating func decreaseAmount() {
        
    }
    
    mutating func checkProductIsInBasket(_ product: ProductsModels.Product?) -> Bool {
        guard
            let product = product
            else {
                return false
        }
        
        let basket = getProducts()
        
        return basket?.contains(where: {$0.id == product.id }) ?? false
    }
    
    // Add Fonksiyonu
    mutating func addProduct(_ product: ProductsModels.Product?) {
        guard
            let product = product
        else {
            return
        }
        
        var basket = getProducts()
        
        basket?.append(
            BasketEntity(
                id: product.id ?? 0,
                name: product.name ?? "",
                price: product.price ?? "",
                image: product.image ?? "",
                currency: ""
            )
        )
        
        do {
            try defaults.setObject(basket, forKey: Keys.key)
        } catch {
            print(error.localizedDescription)
        }
        
        defaults.synchronize()
    }
    
    // Get Fonksiyonu
    mutating func getProducts() -> [BasketEntity]? {
        
        do {
            basketEntity = try defaults.getObject(forKey: Keys.key, castTo: [BasketEntity].self)
        } catch {
            print(error.localizedDescription)
        }
        
        defaults.synchronize()
        
        return basketEntity
    }
    
    //Remove Fonsksiyonu
    
    mutating func delete(id: Int) {
        
        var basket = getProducts()
        
        basket?.removeAll(where: { $0.id == id })
        
        do {
            try defaults.setObject(basket, forKey: Keys.key)
        } catch {
            print(error.localizedDescription)
        }
        
        defaults.synchronize()
    }
}
