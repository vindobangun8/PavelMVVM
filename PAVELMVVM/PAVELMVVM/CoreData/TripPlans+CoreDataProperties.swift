//
//  TripPlans+CoreDataProperties.swift
//  PAVELMVVM
//
//  Created by Datita Devindo Bahana on 18/08/23.
//
//

import Foundation
import CoreData


extension TripPlans {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TripPlans> {
        return NSFetchRequest<TripPlans>(entityName: "TripPlans")
    }

    @NSManaged public var dateEnd: Date?
    @NSManaged public var dateStart: Date?
    @NSManaged public var destination: String?
    @NSManaged public var duration: Int32
    @NSManaged public var id: UUID?
    @NSManaged public var isAbroad: Bool
    @NSManaged public var origin: String?
    @NSManaged public var status: String?
    @NSManaged public var timestamp: Date?
    @NSManaged public var title: String?
    @NSManaged public var categories: NSSet?

}

// MARK: Generated accessors for categories
extension TripPlans {

    @objc(addCategoriesObject:)
    @NSManaged public func addToCategories(_ value: Categories)

    @objc(removeCategoriesObject:)
    @NSManaged public func removeFromCategories(_ value: Categories)

    @objc(addCategories:)
    @NSManaged public func addToCategories(_ values: NSSet)

    @objc(removeCategories:)
    @NSManaged public func removeFromCategories(_ values: NSSet)

}

extension TripPlans {
    var categoriesArray: [Categories] {
            let set = categories as? Set<Categories> ?? []
            return set.sorted {
                $0.name ?? "" < $1.name ?? ""
            }
        }
}


extension TripPlans : Identifiable {

}
