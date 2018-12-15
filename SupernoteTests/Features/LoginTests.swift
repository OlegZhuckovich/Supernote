//
//  LoginTests.swift
//  Supernote
//
//  Created by Oleg Zhuckovich on 12/1/18.
//  Copyright © 2018 Supernote. All rights reserved.
//

class LoginTests: BaseUITests {
  override func beforeEach() {
    super.beforeEach()
    clearOutUsernameAndPasswordFields()
  }

  func testEmptyUsername() {
    tapButton("Login")
    expectToSeeAlert("Username cannot be empty")
    tapButton("OK")
  }

  func testEmptyPassword() {
    fillInUsername()
    tapButton("Login")
    expectToSeeAlert("Password cannot be empty")
    tapButton("OK")
  }

  func testWrongUsernameOrPassword() {
    fillInUsername()
    fillInWrongPassword()
    tapButton("Login")
    expectToSeeAlert("Username or password is incorrect")
    tapButton("OK")
  }

  func testCorrectUsernameAndPassword() {
    fillInUsername()
    fillInCorrectPassword()
    tapButton("Login")
    expectToGoToHomeScreen()
  }
  
}
