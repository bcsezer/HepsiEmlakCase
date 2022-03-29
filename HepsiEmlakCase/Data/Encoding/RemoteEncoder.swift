//
//  RemoteEncoder.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 29.03.2022.
//

import Foundation

public typealias Parameters = [String: Any]

public protocol RemoteEncoderProtocol {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public enum RemoteEncoder {
    
    case urlEncoding
    
    public func encode(urlRequest: inout URLRequest,
                       urlParameters: Parameters?) throws {
        do {
            switch self {
            case .urlEncoding:
                guard let urlParameters = urlParameters else { return }
                try URLQueryEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
            }
        } catch {
            throw error
        }
    }
}
