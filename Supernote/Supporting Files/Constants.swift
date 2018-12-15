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
    
    struct Cells {
        static let AdditionalCellNumber = 0
        static let AdditionalCellsCount = 1
        static let AdditionalCellsHeight = 80
        static let ReuseIDCellsHeight = 60
        static let ReuseID = "reuseID"
        static let OneNoteLabel = "1 note"
    }
    
    struct TextProperties {
        static let Fonts = ["Avenir", "HelveticaNeue", "Futura", "Papyrus", "Optima", "Noteworthy", "Symbol", "Courier New", "Chalkboard SE", "Bodoni 72"]
        static let Sizes = ["12", "14", "16", "18", "20"]
        static let Color = ["Black", "Red", "Blue", "Magenta", "Brown"]
        static let Align = ["Center", "Justified", "Left", "Right", "Natural"]
        
        struct Default {
            static let Font = "Avenir"
            static let Color = "Black"
            static let Size = "14"
            static let Align = "Left"
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
