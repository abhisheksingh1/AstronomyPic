//
//  Constants.swift
//  AstronomyPic
//
//  Created by user on 29/11/21.
//

import Foundation

struct Constants {
    static let errortitle = "Error"
    static let alerttitle = "Alert"
    static let networkErrorMessageToLoadPreviousDetail = "We are not connected to the internet, showing you the last image we have."
    static let networkErrorMessage = "Check your network connection, Try again later"
    
    struct APIHeaders {
       static var kContentType = "Content-Type"
       static var kContentTypeValue = "application/json"
    }
}
