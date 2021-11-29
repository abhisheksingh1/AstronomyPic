//
//  RequestHandler+Extension.swift
//  AstronomyPic
//
//  Created by user on 29/11/21.
//

import Foundation

import Foundation
// MARK: Request Handler Supporting methods
extension RequestHandler {
    func setDefaultHeaders(request: inout URLRequest) {
        request.setValue(Constants.APIHeaders.kContentTypeValue, forHTTPHeaderField: Constants.APIHeaders.kContentType)
    }
}

