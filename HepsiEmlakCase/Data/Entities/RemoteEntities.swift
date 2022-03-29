//
//  RemoteEntities.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 29.03.2022.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

public enum HTTPTask {
    case request
    case requestParameters(bodyEncoding: RemoteEncoder, urlParameters: Parameters?)
}

public enum NetworkError : String, Error {
    case missingURL = "URL is nil."
    case resolvingFailed = "API URL cannot be resolved!"
}

public enum NetworkResponse: String, Error {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}
