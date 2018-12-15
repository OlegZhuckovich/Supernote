//
//  TextPropertiesMapper.swift
//  Supernote
//
//  Created by Oleg Zhuckovich on 12/9/18.
//  Copyright © 2018 Supernote. All rights reserved.
//

import Foundation
import UIKit

class TextPropertiesMapper {
    
    static let textAlignmentMapper = [
        NSTextAlignment.center : "center",
        NSTextAlignment.justified : "justified",
        NSTextAlignment.left : "left",
        NSTextAlignment.right : "right",
        NSTextAlignment.natural : "natural"
    ]
    
    static let textColorMapper = [
        UIColor.black: "Black",
        UIColor.red: "Red",
        UIColor.blue: "Blue",
        UIColor.magenta: "Magenta",
        UIColor.brown: "Brown"
    ]
    
}
