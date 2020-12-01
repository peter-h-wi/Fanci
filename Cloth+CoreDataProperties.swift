//
//  Cloth+CoreDataProperties.swift
//  Fanci
//
//  Created by Peter Wi on 7/15/20.
//  Copyright © 2020 PeterWi. All rights reserved.
//
//

import Foundation
import CoreData


extension Cloth {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cloth> {
        return NSFetchRequest<Cloth>(entityName: "Cloth")
    }
    @NSManaged public var id: UUID?
    @NSManaged public var imageD: Data?
    @NSManaged public var color: String?
    @NSManaged public var favo: Bool
    @NSManaged public var size: String?
    @NSManaged public var type: String?

}
