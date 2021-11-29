//
//  String+Extension.swift
//  AstronomyPic
//
//  Created by user on 29/11/21.
//

import Foundation

enum DateFormat:String {
    case YearMonthDay = "YYYY-MM-dd"
}

extension String {
    func getFormattedDate(fromFormat: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = fromFormat
        return dateFormatter.date(from:self) ?? Date()
    }
}
