//
//  RemoteEndpoint.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 29.03.2022.
//

import Foundation

import Foundation

enum RemoteEndpoint {
    case getProductList
    case cartOrder
}

extension RemoteEndpoint: EndpointType {
    var baseURL: URL {
        guard let url = URL(string: Urls.baseUrl) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .getProductList:
            return "listing"
        case .cartOrder:
            return "order"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getProductList:
            return .get
        case .cartOrder:
            return .post
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getProductList:
            return .requestParameters(
                bodyEncoding: .urlEncoding,
                urlParameters: nil
            )
        case .cartOrder:
            return .requestParameters(bodyEncoding: .urlEncoding, urlParameters: nil)
        }
    }
}
