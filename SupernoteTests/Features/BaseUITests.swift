//
//  BaseUITests.swift
//  Supernote
//
//  Created by Oleg Zhuckovich on 12/1/18.
//  Copyright © 2018 Supernote. All rights reserved.
//

import KIF
import Realm
import RealmSwift

class BaseUITests: KIFTestCase {
  override func beforeAll() {
    super.beforeAll()
    useTestDatabase()
  }

  override func beforeEach() {
    super.beforeEach()
    backToRoot()
  }
}
