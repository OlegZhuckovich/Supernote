//
//  UIViewController+Extensions.swift
//  Supernote
//
//  Created by Oleg Zhuckovich on 12/1/18.
//  Copyright © 2018 Supernote. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showWarningAlertWithMessage(_ message: String) {
        let alertController = UIAlertController(title: "SupernoteWarning", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func showInfoAlertWithMessage(_ message: String, handler: ((_ action: UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: "SupernoteInfo", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: handler))
        present(alertController, animated: true, completion: nil)
    }
    
}
