//
//  Note.swift
//  Supernote
//
//  Created by Oleg Zhuckovich on 12/1/18.
//  Copyright © 2018 Supernote. All rights reserved.
//

import Realm
import RealmSwift

class Note: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var body: String = ""
    @objc dynamic var font: String = ""
    @objc dynamic var color: String = ""
    @objc dynamic var align: String = ""
    @objc dynamic var fontSize: Float = 17
    
    required init() {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    init(_ title: String, _ body: String, _ font: String, _ fontSize: Float, _ color: String, _ align: String) {
        super.init()
        self.title = title
        self.body = body
        self.color = color
        self.align = align
        self.fontSize = fontSize
    }
    
}
