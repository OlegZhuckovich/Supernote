//
//  Constants.swift
//  Supernote
//
//  Created by Oleg Zhuckovich on 12/9/18.
//  Copyright © 2018 Supernote. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    struct TextProperties {
        static let Fonts = ["Avenir", "HelveticaNeue", "Futura", "Papyrus", "Optima", "Noteworthy", "Symbol", "Courier New", "Chalkboard SE", "Bodoni 72"]
        static let Colors = ["Black": UIColor.black,
                             "Red": UIColor.red,
                             "Blue": UIColor.blue,
                             "Magenta": UIColor.magenta,
                             "Brown": UIColor.brown]
        static let Sizes = ["12", "14", "16", "18", "20"]
        
        struct Default {
            static let Font = "Avenir"
            static let Color = "Black"
            static let Size = "14"
        }
    }
    
    struct Alerts {
        static let EmptyUsernameWarning = "Username cannot be empty"
        static let EmptyPasswordWarning = "Password cannot be empty"
        static let WrongUserdataWarning = "Username or password is incorrect"
        static let PasswordsNotMatchesWarning = "Passwords not matches!"
    }

}

let correctUsername = "appcoda"
let correctPassword = "password"

let notificationNewNoteCreated = "NewNoteCreated"
