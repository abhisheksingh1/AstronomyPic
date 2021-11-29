//
//  PictureDetail+CoreDataProperties.swift
//  AstronomyPic
//
//  Created by user on 28/11/21.
//
//

import Foundation
import CoreData


extension PictureDetail {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<PictureDetail> {
        return NSFetchRequest<PictureDetail>(entityName: "PictureDetail")
    }
}
extension PictureDetail : Identifiable {

}
