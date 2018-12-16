//
//  HomeViewController.swift
//  Supernote
//
//  Created by Oleg Zhuckovich on 12/1/18.
//  Copyright © 2018 Supernote. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var emptyNotesImage: UIImageView!
    @IBOutlet weak var notesTableView: UITableView!
    
    var loggedInUser: User?
    var notes: List<Note>?

    lazy var noteViewController : NoteViewController = {
        let noteViewController = UIStoryboard.initializeViewController(NoteViewController.self)
        noteViewController.loggedInUser = self.loggedInUser
        return noteViewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        notesTableView.register(R.nib.userCell)
        self.hideKeyboardWhenTappedAround() 
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.onNewNoteCreated), name: NSNotification.Name(rawValue: notificationNewNoteCreated), object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateNotes()
    }

    @IBAction func onTapAddNoteButton(_ sender: AnyObject) {
        noteViewController.note = nil
        navigationController?.pushViewController(noteViewController, animated: true)
    }

    @objc func onNewNoteCreated() {
        updateTableViewVisibility()
        notesTableView.reloadData()
    }
}

extension HomeViewController {
    
    func updateNotes() {
        notes = loggedInUser?.notes
        updateTableViewVisibility()
        notesTableView.reloadData()
    }

    func updateTableViewVisibility() {
        emptyNotesImage.isHidden = true
        notesTableView.isHidden = false
    }
}
