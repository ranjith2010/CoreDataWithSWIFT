//
//  DataManager.swift
//  SwiftCRUDWithDB
//
//  Created by ranjith on 16/11/15.
//  Copyright © 2015 ranjith. All rights reserved.
//

import Foundation

class DataManager:NSObject {
    class var defaultLocalDB: CoreDataOperations {
        return CoreDataOperations.sharedInstance
    }
}
