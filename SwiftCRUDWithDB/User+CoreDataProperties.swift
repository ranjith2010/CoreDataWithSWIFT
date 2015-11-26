//
//  User+CoreDataProperties.swift
//  SwiftCRUDWithDB
//
//  Created by ranjith on 16/11/15.
//  Copyright © 2015 ranjith. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var name: String?
    @NSManaged var password: String?

}
