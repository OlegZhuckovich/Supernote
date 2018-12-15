//
//  User.swift
//  Supernote
//
//  Created by Oleg Zhuckovich on 12/8/18.
//  Copyright © 2018 Supernote. All rights reserved.
//

import Realm
import RealmSwift

class User: Object {
    @objc dynamic var username: String = ""
    @objc dynamic var password: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var surname: String = ""
    @objc dynamic var activity: String = ""
    @objc dynamic var photo: Data? = nil
    let notes = List<Note>()
    
    required init() {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    init(_ username: String, _ password: String) {
        super.init()
        self.username = username
        self.password = password
    }
    
}
