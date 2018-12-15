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
        "Center" : NSTextAlignment.center,
        "Justified" : NSTextAlignment.justified,
        "Left" : NSTextAlignment.left,
        "Right" : NSTextAlignment.right,
        "Natural" : NSTextAlignment.natural
    ]
    
    static let textColorMapper = [
        "Black" : UIColor.black,
        "Red" : UIColor.red,
        "Blue" : UIColor.blue,
        "Magenta" : UIColor.magenta,
        "Brown" : UIColor.brown
    ]
    
}
