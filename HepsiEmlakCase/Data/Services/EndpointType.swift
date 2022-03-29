//
//  EndpointType.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 29.03.2022.
//

import Foundation

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
}
