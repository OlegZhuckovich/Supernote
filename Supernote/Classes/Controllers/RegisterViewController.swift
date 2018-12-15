//
//  RegisterViewController.swift
//  Supernote
//
//  Created by Oleg Zhuckovich on 12/8/18.
//  Copyright © 2018 Supernote. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBAction func register(_ sender: AnyObject) {
        guard let username = usernameTextField.text, !username.isEmpty else {
            showWarningAlertWithMessage(Constants.Alerts.EmptyUsernameWarning)
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showWarningAlertWithMessage(Constants.Alerts.EmptyPasswordWarning)
            return
        }
        
        if passwordTextField.text != repeatPasswordTextField.text {
            showWarningAlertWithMessage(Constants.Alerts.PasswordsNotMatchesWarning)
            return
        }
        
        let realm = try! Realm()
        try! realm.write {
            guard let username = usernameTextField.text, let password = passwordTextField.text else { return }
            realm.add(User(username, password))
        }
        
        showInfoAlertWithMessage("User \(usernameTextField.text!) was successfully added!", handler: {
            (action) in
            self.navigationController?.popViewController(animated: true)
        })
        
    }
}
