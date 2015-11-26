//
//  CoreDataOperations.swift
//  SwiftCRUDWithDB
//
//  Created by ranjith on 16/11/15.
//  Copyright © 2015 ranjith. All rights reserved.
//

import Foundation
import CoreData

class CoreDataOperations:NSObject, coreDataOperationsProtocol {
    
    var moc = NSManagedObjectContext()
    
    class var sharedInstance: CoreDataOperations {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: CoreDataOperations? = nil
        }
        
        dispatch_once(&Static.onceToken) {
            Static.instance = CoreDataOperations()
        }
        return Static.instance!
    }
    
    override init() {
        moc = CoreDataSharedClass.sharedInstance.managedObjectContext
    }
    
    func createUser(userModel: UserModel) {
        
        let entityDescription = NSEntityDescription.entityForName("User", inManagedObjectContext: moc)
        let user = User(entity:entityDescription!,insertIntoManagedObjectContext: moc)
        
        user.setValue(userModel.name, forKey: "name")
        user.setValue(userModel.password, forKey: "password")
        
        do {
            try moc.save()
            print("contact saved!");
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }
    
    func displayStoredValues() {
        let entityDescription = NSEntityDescription.entityForName("User", inManagedObjectContext: moc)
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = entityDescription
        
        do {
        let results = try moc.executeFetchRequest(fetchRequest)
            if(results.count==0) {
                print("\n\n\nDatabase got empty values")
                return
            }
            for managedObject:AnyObject in results {
                let user = managedObject as! User
                print("name:\(user.name) & password:\(user.password)")
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func deleteFirstObject() {
        let entityDescription = NSEntityDescription.entityForName("User", inManagedObjectContext: moc)
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = entityDescription
        
        do {
            let results = try moc.executeFetchRequest(fetchRequest)
            if (results.count==0) {
                print("There's no records to delete.!")
                return
            }
//            for managedObject:AnyObject in results {
            let managedObject = results.first
                moc.deleteObject(managedObject as! User)
               try moc.save()
            print("first object has been deleted.")
//            }
        } catch let error as NSError {
            print("could not delete \(error),\(error.userInfo)")
        }
    }
    
    func updateName(name:String) {
        let entityDescription = NSEntityDescription.entityForName("User", inManagedObjectContext: moc)
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = entityDescription
        
        do {
            let results = try moc.executeFetchRequest(fetchRequest)
            if (results.count==0) {
                print("There's no records to update.!")
                return
            }
        let user = results.first
        user!.setValue(name, forKey: "name")
         try moc.save()
         print("first object.name has been updated .")
        } catch let error as NSError {
            print("could not update \(error),\(error.userInfo)")
        }
        
    }
    
}
