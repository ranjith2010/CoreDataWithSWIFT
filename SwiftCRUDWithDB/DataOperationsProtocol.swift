//
//  DataOperationsProtocol.swift
//  SwiftCRUDWithDB
//
//  Created by ranjith on 16/11/15.
//  Copyright © 2015 ranjith. All rights reserved.
//

import Foundation

@objc protocol coreDataOperationsProtocol {
    func createUser(userModel:UserModel)
    func displayStoredValues()
    func updateName(name:String)
    func deleteFirstObject()
}

