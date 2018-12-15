//
//  CommonSteps.swift
//  Supernote
//
//  Created by Oleg Zhuckovich on 12/1/18.
//  Copyright © 2018 Supernote. All rights reserved.
//

@testable import Supernote
import RealmSwift

extension BaseUITests {
  func tapButton(_ buttonName: String) {
    tester().tapView(withAccessibilityLabel: buttonName)
  }

  func expectToSeeAlert(_ message: String) {
    expectToSee(message)
  }

  func fillIn(_ accessibilityLabel: String, withText text: String) {
    tester().clearText(fromAndThenEnterText: text, intoViewWithAccessibilityLabel: accessibilityLabel)
  }

  func backToRoot() {
    if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
      navigationController.popToRootViewController(animated: false)
    }
  }

  func fillInUsername() {
    fillIn("Login - Username", withText: correctUsername)
  }

  func visitHomeScreen() {
    fillInUsername()
    fillInCorrectPassword()
    tapButton("Login")
  }
  
  func fillInCorrectPassword() {
    fillIn("Login - Password", withText: correctPassword)
  }


  func useTestDatabase() {
    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = name
  }

  func clearDatabase() {
    let realm = try! Realm()
    try! realm.write {
      realm.deleteAll()
    }
  }

  func expectToSee(_ text: String) {
    tester().waitForView(withAccessibilityLabel: text)
  }

}
