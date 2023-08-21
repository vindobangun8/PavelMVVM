//
//  Documents+CoreDataProperties.swift
//  PAVELMVVM
//
//  Created by Datita Devindo Bahana on 18/08/23.
//
//

import Foundation
import CoreData


extension Documents {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Documents> {
        return NSFetchRequest<Documents>(entityName: "Documents")
    }

    @NSManaged public var category: String?
    @NSManaged public var file: String?
    @NSManaged public var id: Int32
    @NSManaged public var title: String?

}

extension Documents : Identifiable {

}
