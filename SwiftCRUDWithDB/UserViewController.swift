//
//  UserViewController.swift
//  SwiftCRUDWithDB
//
//  Created by ranjith on 05/11/15.
//  Copyright © 2015 ranjith. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    var nameTextField = UITextField()
    var passwordTextField = UITextField()
    var createButton = UIButton()
    var displayButton = UIButton()
    var updateButton = UIButton()
    var deleteButton = UIButton()
    
//    var newNameTextField:UITextField?
    
    var inputTextField: UITextField?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.setViewBackGroundColor()
        self.title = "Create User"
        self .addTextFields()
        self .addCRUDButtons()
        self .addLayouts()
        self .addTapGestureToDismissViewEditing()
    }

    func setViewBackGroundColor() {
        print("Yeah i got my root viewcontroller")
    }
    
    func addTextFields() {
        nameTextField.placeholder = "Enter your name"
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.layer.cornerRadius = CGFloat(5)
        // @Note: For your ref. you can able to write in Immutable code.
//        let myColor : UIColor = UIColor( red: 0.5, green: 0.5, blue:0, alpha: 1.0 )
        var myColor = UIColor()
        myColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        nameTextField.layer.borderColor = myColor.CGColor
        nameTextField.layer.borderWidth = CGFloat(1.0)
        nameTextField.addTarget(self, action: "didTapReturnKey", forControlEvents: UIControlEvents.EditingDidEndOnExit)
        self.view.addSubview(nameTextField)
        
        passwordTextField.placeholder = "password. Pls"
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.layer.cornerRadius = CGFloat(5)
        passwordTextField.layer.borderWidth = CGFloat(1.0)
        passwordTextField.layer.borderColor = myColor.CGColor
        passwordTextField.addTarget(self, action: "didTapReturnKey", forControlEvents: UIControlEvents.EditingDidEndOnExit)
        self.view.addSubview(passwordTextField)
        
    }
    
    func addCRUDButtons() {
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.setTitle("Create", forState: .Normal)
        createButton.backgroundColor = UIColor.blueColor()
        createButton.layer.cornerRadius = CGFloat(5.0)
        createButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        createButton.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 17)
        createButton.addTarget(self, action: "didTapCreateButton", forControlEvents: .TouchUpInside)
        self.view.addSubview(createButton)
        
        displayButton.translatesAutoresizingMaskIntoConstraints = false
        displayButton.setTitle("Display", forState: .Normal)
        displayButton.backgroundColor = UIColor.blueColor()
        displayButton.layer.cornerRadius = CGFloat(5.0)
        displayButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        displayButton.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 17)
        displayButton.addTarget(self, action: "didTapDisplayButton", forControlEvents: .TouchUpInside)
        self.view.addSubview(displayButton)
        
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.setTitle("Update", forState: .Normal)
        updateButton.backgroundColor = UIColor.blueColor()
        updateButton.layer.cornerRadius = CGFloat(5.0)
        updateButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        updateButton.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 17)
        updateButton.addTarget(self, action: "didTapUpdateButton", forControlEvents: .TouchUpInside)
        self.view.addSubview(updateButton)
        
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.setTitle("Delete", forState: .Normal)
        deleteButton.backgroundColor = UIColor.redColor()
        deleteButton.layer.cornerRadius = CGFloat(5.0)
        deleteButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        deleteButton.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 17)
        deleteButton.addTarget(self, action: "didTapDeleteButton", forControlEvents: .TouchUpInside)
        self.view.addSubview(deleteButton)
    
    }
    
    func addLayouts() {
        self.view.removeConstraints(self.view.constraints)
        var arrayOfLayoutConstriants = [NSLayoutConstraint]()
    
        let views = Dictionary(dictionaryLiteral:
            ("nameTextField",nameTextField),
            ("passwordTextField",passwordTextField),
            ("createButton",createButton),
            ("displayButton",displayButton),
            ("updateButton",updateButton),
            ("deleteButton",deleteButton))
        
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-100-[nameTextField(50)]-[passwordTextField(50)]-[createButton(50)]-[displayButton(50)]-[updateButton(50)]-[deleteButton(50)]", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: views)
        
        let horizontalNameTextFieldConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[nameTextField]-|", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: views)
        
        let horizontalPasswordTextFieldConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[passwordTextField]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        
        let horizontalCreateButtonConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[createButton]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        
        let horizontalDisplayButtonConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[displayButton]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        
        let horizontalUpdateButtonConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[updateButton]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        
        let horizontalDeleteButtonConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[deleteButton]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        
        arrayOfLayoutConstriants += verticalConstraints
        arrayOfLayoutConstriants += horizontalNameTextFieldConstraints
        arrayOfLayoutConstriants += horizontalPasswordTextFieldConstraints
        arrayOfLayoutConstriants += horizontalCreateButtonConstraints
        arrayOfLayoutConstriants += horizontalDisplayButtonConstraints
        arrayOfLayoutConstriants += horizontalUpdateButtonConstraints
        arrayOfLayoutConstriants += horizontalDeleteButtonConstraints

        self.view.addConstraints(arrayOfLayoutConstriants)
    }
    
    func didTapCreateButton() {
        if nameTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            let alertController = UIAlertController(title: "Alert", message: "Empty String", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)

        }
        else {
            // save user details in CoreData.
            var inputDictionary = [String:AnyObject]()
            inputDictionary["name"] = self.nameTextField.text
            inputDictionary["password"] = self.passwordTextField.text
            let userModel = UserModel(inputDictionary: inputDictionary)
            DataManager.defaultLocalDB.createUser(userModel)
        }
    }
  
    func didTapDisplayButton() {
        DataManager.defaultLocalDB.displayStoredValues()
    }
    
    func didTapDeleteButton() {
        DataManager.defaultLocalDB.deleteFirstObject()
    }
    
    
    // we are updating the first Object name value.
    // simple update with existing one. here we are not doing any find and update.
    func didTapUpdateButton() {
        // @reference:AshFurrow blog
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
        let ok = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            // Do whatever you want with inputTextField?.text
            print("\(self.inputTextField?.text)")
            
            if (self.inputTextField!.text!.isEmpty) {
                print("enter some value to be update");
                return
            }
            DataManager.defaultLocalDB.updateName((self.inputTextField?.text)!)
        })
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in }
        
        alertController.addAction(ok)
        alertController.addAction(cancel)
        
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            self.inputTextField = textField
        } 
        
        presentViewController(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addTapGestureToDismissViewEditing() {
        let singleTapGesture = UITapGestureRecognizer()
        singleTapGesture .addTarget(self, action: "didTapTapGestureOnView")
        self.view .addGestureRecognizer(singleTapGesture)
    }
    
    func didTapReturnKey() {
        
    }
    
    func didTapTapGestureOnView() {
        self.view .endEditing(true)
    }

}

