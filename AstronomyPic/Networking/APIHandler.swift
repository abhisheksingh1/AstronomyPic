//
//  APIHandler.swift
//  AstronomyPic
//
//  Created by user on 29/11/21.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

//Add addition RequestHandler functions
protocol RequestHandler {
    func setDefaultHeaders(request: inout URLRequest)
}

protocol ResponseHandler {
    func parseResponse<C: Codable>(data: Data, response: HTTPURLResponse) throws -> C
}
