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
        //emptyNotesImage.isHidden = (notes?.count)! > 0
        //notesTableView.isHidden = !emptyNotesImage.isHidden
        emptyNotesImage.isHidden = true
        notesTableView.isHidden = false
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let userNotes = notes else { return 1 }
        return userNotes.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.userCell, for: indexPath) as! UserCell
            cell.usernameLabel?.text = "Oleg Zhuckovich"
            cell.activityLabel?.text = loggedInUser?.username
            return cell
        } else {
            let cell = tableView.defaultCellWithReuseID("reuseID")
            let note = notes![indexPath.row]
            cell.textLabel?.text = note.title
            cell.detailTextLabel?.text = note.body
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        noteViewController.note = notes![indexPath.row]
        navigationController?.pushViewController(noteViewController, animated: true)
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.row == 0 ? false : true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let realm = try! Realm()
            try! realm.write {
                realm.delete(notes![indexPath.row])
            }
            if #available(iOS 11.0, *) {
                tableView.performBatchUpdates({
                    tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
                })
            } else {
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
                tableView.endUpdates()
            }
            updateTableViewVisibility()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 80 : 60
    }
}
