//
//  City+CoreDataProperties.swift
//  SearchWeather2
//
//  Created by Field Employee on 6/22/21.
//
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }

    @NSManaged public var city: String?

}

extension City : Identifiable {

}
