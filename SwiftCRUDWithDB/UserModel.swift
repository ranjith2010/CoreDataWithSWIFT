//
//  UserModel.swift
//  SwiftCRUDWithDB
//
//  Created by ranjith on 06/11/15.
//  Copyright © 2015 ranjith. All rights reserved.
//

import Foundation

class UserModel: NSObject {
    var inputDictionary = Dictionary<String,AnyObject>()
    
    convenience init(inputDictionary: Dictionary<String,AnyObject>) {
        self.init()
        self.inputDictionary = inputDictionary
    }

    var name : String {
        set(newName) {
            inputDictionary["name"] = newName
        }
        get {
            // MIND IT: The value is Kind of `AnyObject`
            return (inputDictionary["name"] as? String)!
        }
    }
    
    var password : String {
        set(newPassword) {
            inputDictionary["password"] = newPassword
        }
        get {
            return (inputDictionary["password"] as? String)!
        }
    }
    
}
