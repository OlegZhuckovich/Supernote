//
//  UITableView+Extensions.swift
//  Supernote
//
//  Created by Oleg Zhuckovich on 12/1/18.
//  Copyright © 2018 Supernote. All rights reserved.
//

import UIKit

extension UITableView {
  func defaultCellWithReuseID(_ reuseID: String) -> UITableViewCell {
    return self.dequeueReusableCell(withIdentifier: reuseID) ?? UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: reuseID)
  }
}
