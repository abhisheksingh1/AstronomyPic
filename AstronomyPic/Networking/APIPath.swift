//
//  APIPath.swift
//  AstronomyPic
//
//  Created by user on 29/11/21.
//

import Foundation

#if DEBUG
let environment = APIEnvironment.development
#else
let environment = APIEnvironment.production
#endif

let baseURL = environment.baseURL()
let APIKey = environment.apiKey()

struct APIPath {
    //User Detail
    static var pictureDetail: String { return "\(baseURL)?api_key=\(APIKey)"}
}


