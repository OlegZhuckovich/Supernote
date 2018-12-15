//
//  UIColor+Extensions.swift
//  Supernote
//
//  Created by Oleg Zhuckovich on 12/2/18.
//  Copyright © 2018 Supernote. All rights reserved.
//

import UIKit

extension UIColor {
  class func colorWithRed(red: NSInteger, green: NSInteger, blue: NSInteger) -> UIColor {
    let max: CGFloat = 255.0
    return UIColor(red: CGFloat(red) / max, green: CGFloat(green) / max, blue: CGFloat(blue) / max, alpha: 1)
  }
}
