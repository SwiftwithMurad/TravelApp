//
//  TravelList+CoreDataProperties.swift
//  TravelApp
//
//  Created by Mac on 10.01.25.
//
//

import Foundation
import CoreData


extension TravelList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TravelList> {
        return NSFetchRequest<TravelList>(entityName: "TravelList")
    }

    @NSManaged public var image: String?
    @NSManaged public var tripName: String?
    @NSManaged public var countryName: String?

}

extension TravelList : Identifiable {

}
