//
//  PictureDetail+CoreDataClass.swift
//  AstronomyPic
//
//  Created by user on 28/11/21.
//
//

import Foundation
import CoreData

@objc(PictureDetail)
public class PictureDetail: NSManagedObject, Codable {
    
    @NSManaged public var title: String?
    @NSManaged public var date: String?
    @NSManaged public var explanation: String?
    @NSManaged public var url: URL?
    @NSManaged public var pictureImage: Data?
    
    enum CodingKeys: String, CodingKey {
        case title
        case date
        case explanation
        case url
        case pictureImage
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.context else { fatalError("cannot find context key") }
        guard let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext else { fatalError("cannot Retrieve context") }
        guard let entity = NSEntityDescription.entity(forEntityName: "PictureDetail", in: managedObjectContext) else { fatalError() }
        self.init(entity: entity, insertInto: nil)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.date = try container.decode(String.self, forKey: .date)
        self.explanation = try container.decode(String.self, forKey: .explanation)
        guard let urlString = try container.decodeIfPresent(String.self, forKey: .url) else { return }
        if let picUrl = URL(string: urlString) {
            self.url = picUrl
            do {
                let data = try Data(contentsOf: picUrl)
                self.pictureImage = data
            } catch {
                print("Image not found")
            }
            
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(title, forKey: .title)
        try container.encode(date, forKey: .date)
        try container.encode(explanation, forKey: .explanation)
        try container.encode(url, forKey: .url)
        try container.encode(pictureImage, forKey: .pictureImage)
    }
}

extension CodingUserInfoKey {
    static let context = CodingUserInfoKey(rawValue: "context")
}
