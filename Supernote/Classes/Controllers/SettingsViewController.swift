//
//  SettingsViewController.swift
//  Supernote
//
//  Created by Oleg Zhuckovich on 12/15/18.
//  Copyright © 2018 Supernote. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var activityTextField: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var currentPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    
    var loggedInUser: User?
    
    override func viewDidLoad() {
        guard let user = loggedInUser else { return }
        if !user.name.isEmpty {
            nameTextField.text = user.name
        }
        if !user.surname.isEmpty {
            surnameTextField.text = user.surname
        }
        if !user.activity.isEmpty {
            activityTextField.text = user.activity
        }
        usernameLabel.text = "@" + user.username
    }
    
    @IBAction func saveChanges(_ sender: AnyObject) {
        
    }
    
    @IBAction func deleteAccount(_ sender: AnyObject) {
        
        let deleteAccountAlert = UIAlertController(title: "SupernoteWarning", message: "Are you sure you want to delete the account? This action cannot be undone", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .destructive, handler: { (action) -> Void in
            let realm = try! Realm()
            try! realm.write {
                realm.delete(self.loggedInUser!)
            }
            self.performSegue(withIdentifier: "unwindToLoginController", sender: self)
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        deleteAccountAlert.addAction(ok)
        deleteAccountAlert.addAction(cancel)
        
        self.present(deleteAccountAlert, animated: true, completion: nil)
    }
    
}
