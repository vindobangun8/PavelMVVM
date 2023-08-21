//
//  Categories+CoreDataProperties.swift
//  PAVELMVVM
//
//  Created by Datita Devindo Bahana on 18/08/23.
//
//

import Foundation
import CoreData


extension Categories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Categories> {
        return NSFetchRequest<Categories>(entityName: "Categories")
    }

    @NSManaged public var icon: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isWinter: Bool
    @NSManaged public var name: String?
    @NSManaged public var items: NSSet?
    @NSManaged public var trip: TripPlans?

}

// MARK: Generated accessors for items
extension Categories {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: Items)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: Items)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

extension Categories{
    var itemArray: [Items] {
            let set = items as? Set<Items> ?? []
            return set.sorted {
                $0.name ?? "" < $1.name ?? ""
            }
        }
}



extension Categories : Identifiable {

}
