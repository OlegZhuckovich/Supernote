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
                    return
            }
            titleTextField.text = note.title
            noteTextView.text = note.body
            noteTextView.font = UIFont(name: note.font, size: CGFloat(Int(note.fontSize)))
            noteTextView.textColor = TextPropertiesMapper.textColorMapper[note.color] ?? .black
            noteTextView.textAlignment = TextPropertiesMapper.textAlignmentMapper[note.align] ?? .left
            navigationItem.rightBarButtonItem?.title = "Update"
            onNoteTitleTextFieldChanged(titleTextField)
        }
    }
    
    var loggedInUser: User?
    
    var fonts = [] as [String]
    var colors = [] as [String]
    var sizes = [] as [String]
    
    var currentFont = Constants.TextProperties.Default.Font
    var currentFontSize = Constants.TextProperties.Default.Size
    var currentColor = Constants.TextProperties.Default.Color
    var currentAlign = Constants.TextProperties.Default.Align
    
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
        currentAlign = TextPropertiesMapper.textAlignmentMapper.allKeys(forValue: .left).first!
        noteTextView.textAlignment = .left
    }
    
    @IBAction func centerTextAlign(_ sender: Any) {
        currentAlign = TextPropertiesMapper.textAlignmentMapper.allKeys(forValue: .center).first!
        noteTextView.textAlignment = .center
    }
    
    @IBAction func rightTextAlign(_ sender: Any) {
        currentAlign = TextPropertiesMapper.textAlignmentMapper.allKeys(forValue: .right).first!
        noteTextView.textAlignment = .right
    }
    
    @IBAction func justifyTextAlign(_ sender: Any) {
        currentAlign = TextPropertiesMapper.textAlignmentMapper.allKeys(forValue: .justified).first!
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
        colors = Array(TextPropertiesMapper.textColorMapper.keys)
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
        let realm = try! Realm()
        
        print(title)
        print(noteTextView.text)
        print(currentFont)
        print(currentFontSize)
        print(currentColor)
        print(currentAlign)
        
        
        
        try! realm.write {
            if let note = self.note {
                loggedInUser?.notes.append(note)
            } else if let title = titleTextField.text,
                let body = noteTextView.text,
                let currentFontSize = Float(currentFontSize) {
                loggedInUser?.notes.append(Note(title, body, currentFont, currentFontSize, currentColor, currentAlign))
            }
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

