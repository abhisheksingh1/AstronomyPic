//
//  APIManager.swift
//  AstronomyPic
//
//  Created by user on 29/11/21.
//

import Foundation

struct APIManager: ResponseHandler {
    static let shared = APIManager()
    var urlSession: URLSession
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func loadAPIRequest<C:Codable>(requestData: URLRequest?, completionHandler: @escaping (C?, ServiceError?) -> ()) {
        if !Reachability.isConnectedToNetwork(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                completionHandler(nil, ServiceError(httpStatus: 1000, message: "Check your network connection, Try again later"))
            }
            return
        }
        if let urlRequest = requestData {
            urlSession.dataTask(with: urlRequest) { (data, response, error) in
                if let httpResponse = response as? HTTPURLResponse {
                    guard error == nil else {
                        completionHandler(nil, ServiceError(httpStatus: httpResponse.statusCode, message: "ServiceError : \(error?.localizedDescription ?? "Error occured")"))
                        return
                    }
                    guard let responseData = data else {
                        completionHandler(nil, ServiceError(httpStatus: httpResponse.statusCode, message: "ServiceError : \(error?.localizedDescription ?? "Data not found")"))
                        return
                    }
                    if let jsonResult = try? JSONSerialization.jsonObject(with: responseData, options: []) as? NSDictionary {
                        print("Synchronous\(jsonResult)")
                    }
                    do {
                        let parsedResponse:C = try parseResponse(data: responseData, response: httpResponse)
                        completionHandler(parsedResponse, nil)
                    } catch let error {
                        guard let serviceError = error as? ServiceError else {
                            completionHandler(nil, nil)
                            return
                        }
                        completionHandler(nil, serviceError)
                    }
                }
            }.resume()
        }
    }
}
