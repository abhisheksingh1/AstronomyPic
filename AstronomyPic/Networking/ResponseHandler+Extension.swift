//
//  ResponseHandler+Extension.swift
//  AstronomyPic
//
//  Created by user on 29/11/21.
//

import Foundation

struct ServiceError: Error,Codable {
    let httpStatus: Int
    let message: String
}

extension ResponseHandler {
    fileprivate func defaultParseResponse<T: Codable>(data: Data, response: HTTPURLResponse) throws -> T {
        let jsonDecoder = JSONDecoder()
        //jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        if (200...299).contains(response.statusCode) {
            do {
                //Core data
                let context = CoreDataStack.shared.managedObjectContext
                guard let contextUserInfoKey = CodingUserInfoKey.context else { fatalError("cannot find context key") }
                jsonDecoder.userInfo[contextUserInfoKey] = context
                let body = try jsonDecoder.decode(T.self, from: data)
                return body
                
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
                throw ServiceError(httpStatus: response.statusCode, message: context.debugDescription)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                throw ServiceError(httpStatus: response.statusCode, message: context.debugDescription)
                
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                throw ServiceError(httpStatus: response.statusCode, message: context.debugDescription)
                
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
                throw ServiceError(httpStatus: response.statusCode, message: context.debugDescription)
            } catch {
                print("error: ", error)
                throw ServiceError(httpStatus: response.statusCode, message: error.localizedDescription)
            }
        } else {
            throw ServiceError(httpStatus: response.statusCode, message: "Unknown Error")
        }
    }
    
    func parseResponse<C: Codable>(data: Data, response: HTTPURLResponse) throws -> C  {
        return try defaultParseResponse(data: data,response: response)
    }
}
