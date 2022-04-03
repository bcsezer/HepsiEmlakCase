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
    
    //Arttırma fonksiyonu
    mutating func increaseAmount(selectedProductId: Int) -> [BasketEntity] {
        
        var basket = getProducts()
        
//        let productPrice = basket?.first(where: {$0.id == selectedProductId})?.price
        var productCount = basket?.first(where: {$0.id == selectedProductId})?.count ?? 0
        let initialPrice = defaults.object(forKey: "InitialPrice") as? String
        
        let stringPrice = initialPrice?.replacingOccurrences(of: "TRY", with: "").replacingOccurrences(of: " ", with: "")
        
        productCount += 1

        let firstPrice = stringPrice?.stringToFloat() ?? 0.0
        let lastPrice = (firstPrice * CGFloat(productCount)).description
        
        if let index = basket?.firstIndex(where: {$0.id == selectedProductId}) {
            basket?[index].price = "\(lastPrice) TRY"
            basket?[index].count = productCount
        }
        
        updateList(basket: basket ?? [])
        return basket ?? []
    }
    
    //Azaltma Fonksiyonu
    mutating func decreaseAmount(selectedProductId: Int) -> [BasketEntity] {
        
        var basket = getProducts()
        
        let productPrice = basket?.first(where: {$0.id == selectedProductId})?.price
        var productCount = basket?.first(where: {$0.id == selectedProductId})?.count ?? 0
        
        let stringPrice = productPrice?.replacingOccurrences(of: "TRY", with: "").replacingOccurrences(of: " ", with: "")
        
        productCount -= 1
        
        if productCount >= 1 {
            let firstPrice = stringPrice?.stringToFloat() ?? 0.0
            let lastPrice = (firstPrice / CGFloat(productCount)).description
            
            if let index = basket?.firstIndex(where: {$0.id == selectedProductId}) {
                basket?[index].price = "\(lastPrice) TRY"
                basket?[index].count = productCount
            }
        }
        
        updateList(basket: basket ?? [])
        return basket ?? []
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
        let defaultCount = 1
        
        basket?.append(
            BasketEntity(
                id: product.id ?? 0,
                name: product.name ?? "",
                price: product.price ?? "",
                image: product.image ?? "",
                currency: "",
                count: defaultCount
            )
        )
        
        do {
            defaults.setValue(product.price, forKey: "InitialPrice")
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
    
    // Update Fonksiyonu
    mutating func updateList(basket: [BasketEntity]) {
        do {
            try defaults.setObject(basket, forKey: Keys.key)
        } catch {
            print(error.localizedDescription)
        }
        defaults.synchronize()
    }
}
