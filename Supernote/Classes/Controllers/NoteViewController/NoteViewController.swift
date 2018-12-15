//
//  NoteViewController.swift
//  Supernote
//
//  Created by Oleg Zhuckovich on 12/1/18.
//  Copyright © 2018 Supernote. All rights reserved.
//

import UIKit
import RealmSwift

class NoteViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var fontPicker: UIPickerView!
    @IBOutlet weak var colorPicker: UIPickerView!
    @IBOutlet weak var sizePicker: UIPickerView!
    @IBOutlet weak var alignHeightContraint: NSLayoutConstraint!
    
    @IBOutlet weak var expandButton: UIButton!
    @IBOutlet weak var alignView: UIView!
    @IBOutlet weak var leftAlignButton: UIButton!
    @IBOutlet weak var centerAlignButton: UIButton!
    @IBOutlet weak var rightAlignButton: UIButton!
    @IBOutlet weak var justifyAlignButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    var note: Note? {
        didSet {
            guard titleTextField != nil, noteTextView != nil,
                let note = note else {
                    navigationItem.rightBarButtonItem?.title = "Create"
                    return }
            
            titleTextField.text = note.title
            noteTextView.text = note.body
            noteTextView.textColor = (TextPropertiesMapper.textColorMapper.allKeys(forValue: note.color)).first
            noteTextView.textAlignment = (TextPropertiesMapper.textAlignmentMapper.allKeys(forValue: note.align)).first!
            
            navigationItem.rightBarButtonItem?.title = "Update"
            onNoteTitleTextFieldChanged(titleTextField)
        }
    }
    
    var loggedInUser: User?
    
    var fonts = [] as [String]
    var colors = [] as [String]
    var sizes = [] as [String]
    
    var currentFont = "Avenir"
    var currentColor = "Black"
    var currentFontSize = "14"
    
    var isAlignSectionCollapse: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.alignHeightContraint.constant = 0
        setupNavigationButtons()
        setupBodyTextView()
        setupPickers()
    }
    
    @IBAction func onNoteTitleTextFieldChanged(_ sender: AnyObject) {
        navigationItem.rightBarButtonItem?.isEnabled = titleTextField.text?.count > 0
    }
    
    @IBAction func leftTextAlign(_ sender: Any) {
        noteTextView.textAlignment = .left
    }
    
    @IBAction func centerTextAlign(_ sender: Any) {
        noteTextView.textAlignment = .center
    }
    
    @IBAction func rightTextAlign(_ sender: Any) {
        noteTextView.textAlignment = .right
    }
    
    @IBAction func justifyTextAlign(_ sender: Any) {
        noteTextView.textAlignment = .justified
    }
    
    @IBAction func expandCollapseAlignView(_ sender: Any) {
        if isAlignSectionCollapse == true {
            self.alignHeightContraint.constant = 45
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
                self.alignView.transform = CGAffineTransform.identity
                self.expandButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                self.alignView.isHidden = false
            }
        } else {
            self.alignHeightContraint.constant = 0
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
                self.alignView.transform = CGAffineTransform(scaleX: 1, y: 0)
                self.expandButton.transform = CGAffineTransform.identity
            }
        }
        self.isAlignSectionCollapse = !self.isAlignSectionCollapse
    }
    
    func setupPickers() {
        fonts = Constants.TextProperties.Fonts
        colors = Array(Constants.TextProperties.Colors.keys)
        sizes = Constants.TextProperties.Sizes
    }

    @objc func onTapCreateButton(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)
        saveNoteToDatabase()
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationNewNoteCreated), object: nil)
    }

    @objc func onTapCancelButton(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)
    }

}


extension NoteViewController {
    fileprivate func setupNavigationButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(NoteViewController.onTapCreateButton))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(NoteViewController.onTapCancelButton))
    }

    fileprivate func setupBodyTextView() {
        noteTextView.layer.borderColor = UIColor.colorWithRed(red: 204, green: 204, blue: 204).cgColor
        noteTextView.layer.borderWidth = 0.5
        noteTextView.layer.cornerRadius = 4;
    }

    fileprivate func saveNoteToDatabase() {
        

        
        do {
            let realm = try Realm()
        try realm.write {
            
            print("dasdasdsa")
            
            print(self.note) // nil
            print(titleTextField.text)  // Optional("fdsfdsfdsfdsfdsfds")
            print(noteTextView.text)    // Optional("fdsfdsfdsfdsf")
            print(noteTextView.font?.fontName)    // Optional(<UICTFont: 0x7fe3fff1d160>
                                        //      font-family: "Avenir-Book"; font-weight: normal; font-style: normal;                           font-size: 17.00pt)
            print(colorPicker.selectedRow(inComponent: 0))   //nil
            print(colorPicker.selectedRow(inComponent: 1))
            print(colorPicker.selectedRow(inComponent: 2))
            
            
            print(noteTextView.textAlignment.rawValue)   //
            
            if let note = self.note {
                print(loggedInUser?.notes.count)
                loggedInUser?.notes.append(note)
            } else if let title = titleTextField.text,
                let body = noteTextView.text,
                let font = noteTextView.font,
                let textColor = noteTextView.textColor,
                let color = TextPropertiesMapper.textColorMapper[(textColor)],
                let align = TextPropertiesMapper.textAlignmentMapper[noteTextView.textAlignment] {
                print(loggedInUser?.notes.count)
                loggedInUser?.notes.append(Note(title, body, font.fontName, Float(font.pointSize), color, align))
            }
        }
        } catch let error {
            print("Could not add message due to error:\n\(error)")
        }
        
        
        
        print(loggedInUser!.notes.count)
    }
}

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}

