//
//  Meal.swift
//  FoodTracker
//
//  Created by Seven on 11/18/15.
//  Copyright © 2015 Seven. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {
// MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
// MARK: Archiving Paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
// MARK: Types
    struct Propertykey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
// MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        super.init()
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
// MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: Propertykey.nameKey)
        aCoder.encodeObject(photo, forKey: Propertykey.photoKey)
        aCoder.encodeInteger(rating, forKey: Propertykey.ratingKey)
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(Propertykey.nameKey) as! String
        let photo = aDecoder.decodeObjectForKey(Propertykey.photoKey) as? UIImage
        let rating = aDecoder.decodeIntegerForKey(Propertykey.ratingKey)
        
        self.init(name: name, photo: photo, rating: rating)
        
    }
    
}