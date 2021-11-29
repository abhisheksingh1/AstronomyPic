//
//  PictureDetailAPIRequestHandler.swift
//  AstronomyPic
//
//  Created by user on 29/11/21.
//

import Foundation

struct PictureDetailAPIRequestHandler: RequestHandler {
    
    func pictureDetailRequest() -> URLRequest? {
        let urlString = APIPath.pictureDetail
        if let url = URL(string:urlString) {
            var urlRequest = URLRequest(url: url)
            setDefaultHeaders(request: &urlRequest)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return urlRequest
        }
        return nil
    }
}
