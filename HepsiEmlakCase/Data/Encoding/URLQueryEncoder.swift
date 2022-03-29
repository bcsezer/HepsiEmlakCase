//
//  URLQueryEncoder.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 29.03.2022.
//

import Foundation

import Foundation

public struct URLQueryEncoder: RemoteEncoderProtocol {
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        
        guard let url = urlRequest.url else { throw NetworkError.missingURL }
        
        if var urlComponents = URLComponents(url: url,
                                             resolvingAgainstBaseURL: false), !parameters.isEmpty {
            
            let queryItems: [URLQueryItem] = []
            urlComponents.queryItems = queryItems
            urlComponents.queryItems = queryComponents(parameters: parameters)
            urlRequest.url = urlComponents.url
        } else {
            throw NetworkError.resolvingFailed
        }
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
    
    private func queryComponents(parameters: Parameters) -> [URLQueryItem] {
        var components = [URLQueryItem]()
        
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.append(queryItem)
        }
        
        return components
    }
}
