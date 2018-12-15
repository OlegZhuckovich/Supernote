//
//  NoteViewControllerExtensions.swift
//  Supernote
//
//  Created by Oleg Zhuckovich on 12/14/18.
//  Copyright © 2018 Supernote. All rights reserved.
//

import Foundation
import UIKit

extension NoteViewController:  UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            currentFont = fonts[row]
            noteTextView.font = UIFont(name: fonts[row], size: (noteTextView.font?.pointSize)!)
        case 2:
            currentColor = colors[row]
            noteTextView.textColor = TextPropertiesMapper.textColorMapper[colors[row]]
        default:
            currentFontSize = sizes[row]
            noteTextView.font = UIFont(name: (noteTextView.font?.fontName)!, size: CGFloat(Int(sizes[row])!))
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1: return fonts.count
        case 2: return colors.count
        default: return sizes.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1: return fonts[row]
        case 2: return colors[row]
        default: return sizes[row]
        }
    }
    
}

extension Dictionary where Value: Equatable {
    func allKeys(forValue val: Value) -> [Key] {
        return self.filter { $1 == val }.map { $0.0 }
    }
}
