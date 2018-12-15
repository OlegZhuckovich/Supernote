//
//  UIStoryboard+Extensions.swift
//  Supernote
//
//  Created by Oleg Zhuckovich on 12/1/18.
//  Copyright © 2018 Supernote. All rights reserved.
//

import UIKit

extension UIStoryboard {
  class func main() -> UIStoryboard {
    return UIStoryboard(name: "Main", bundle: nil)
  }

  class func initializeViewController<T>(_ viewController: T.Type) -> T where T: UIViewController {
    return UIStoryboard.main().instantiateViewController(withIdentifier: String(describing: viewController)) as! T
  }
}
