//
//  LoginViewController.swift
//  Supernote
//
//  Created by Oleg Zhuckovich on 12/1/18.
//  Copyright © 2018 Supernote. All rights reserved.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var loggedInUser: User?
    var registeredUsers: Results<User>?
    
    lazy var homeViewController : HomeViewController = {
        let homeViewController = UIStoryboard.initializeViewController(HomeViewController.self)
        homeViewController.loggedInUser = self.loggedInUser
        return homeViewController
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func clearUserData() {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }

    @IBAction func onTapLoginButton(_ sender: AnyObject) {
        
        guard let username = usernameTextField.text , username.count > 0 else {
            showWarningAlertWithMessage(Constants.Alerts.EmptyUsernameWarning)
            return
        }
        guard let password = passwordTextField.text , password.count > 0 else {
            showWarningAlertWithMessage(Constants.Alerts.EmptyPasswordWarning)
            return
        }

        let realm = try! Realm()
        if let loggedInUser = realm.objects(User.self).filter("username = '\(username)' AND password = '\(password)'").first {
            print(loggedInUser.notes.count)
            self.loggedInUser = loggedInUser
            print(loggedInUser.username)
            print(loggedInUser.notes.count)
            clearUserData()
            homeViewController.loggedInUser = self.loggedInUser
            navigationController?.pushViewController(homeViewController, animated: true)
        } else {
            showWarningAlertWithMessage(Constants.Alerts.WrongUserdataWarning)
        }

  }
}
