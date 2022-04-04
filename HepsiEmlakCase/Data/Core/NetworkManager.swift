//
//  NetworkManager.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 29.03.2022.
//

import Foundation

import Foundation

struct NetworkManager {
    static let shared = NetworkManager()
    
    let provider = NetworkProvider<RemoteEndpoint>()
    
    func getList(completion: @escaping ClosureType<[ProductEntity]>, failure: @escaping Failure) {
        provider.request(
            .getProductList,
            model: [ProductEntity].self,
            completion: completion,
            failure: failure
        )
    }
    
    func postList(completion: @escaping ClosureType<[PostModel]>, failure: @escaping Failure) {
        provider.request(
            .postList,
            model: [PostModel].self,
            completion: completion,
            failure: failure
        )
    }
}
