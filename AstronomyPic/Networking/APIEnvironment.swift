//
//  APIEnvironment.swift
//  AstronomyPic
//
//  Created by user on 29/11/21.
//

import Foundation

enum APIEnvironment {
    case development
    case production
    
    func baseURL () -> String {
        return "https://\(subdomain()).\(domain())"+"\(route())"
    }
    
    func domain() -> String {
        switch self {
        case .development:
            return "nasa.gov"
        case .production:
            return "nasa.gov"
        }
    }
    
    func subdomain() -> String {
        switch self {
        case .development, .production:
            return "api"
        }
    }
    
    func route() -> String {
        return "/planetary/apod"
    }
    
    func apiKey() -> String {
        switch self {
        case .development:
            return "WFyOeRFtjoXcO4QmDnztqP5WvoLL5bnYQ9PBvhEf"
        case .production:
            return "WFyOeRFtjoXcO4QmDnztqP5WvoLL5bnYQ9PBvhEf"
        }
    }
}
