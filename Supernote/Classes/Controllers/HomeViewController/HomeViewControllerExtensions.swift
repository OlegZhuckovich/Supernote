//
//  HomeViewControllerExtensions.swift
//  Supernote
//
//  Created by Oleg Zhuckovich on 12/15/18.
//  Copyright © 2018 Supernote. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let userNotes = notes else { return Constants.Cells.AdditionalCellsCount }
        return userNotes.count + Constants.Cells.AdditionalCellsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == Constants.Cells.AdditionalCellNumber {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.userCell, for: indexPath),
                let user = loggedInUser else { return UITableViewCell() }
            cell.nameSurnameLabel.text = (!user.name.isEmpty && !user.surname.isEmpty) ? user.name + " " + user.surname : "Name Surname"
            cell.activityLabel.text = !user.activity.isEmpty ? user.activity : "Activity"
            cell.usernameLabel?.text = "@" + user.username
            if let notes = notes {
                cell.notesLabel.text = notes.count == 1 ? Constants.Cells.OneNoteLabel : "\(notes.count) notes"
            }
            return cell
        } else {
            let cell = tableView.defaultCellWithReuseID(Constants.Cells.ReuseID)
            let note = notes![indexPath.row - Constants.Cells.AdditionalCellsCount]
            cell.textLabel?.text = note.title
            cell.detailTextLabel?.text = note.body
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row != Constants.Cells.AdditionalCellNumber {
            noteViewController.note = notes![indexPath.row - Constants.Cells.AdditionalCellsCount]
            navigationController?.pushViewController(noteViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.row == Constants.Cells.AdditionalCellNumber ? false : true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let realm = try! Realm()
            try! realm.write {
                realm.delete(notes![indexPath.row - Constants.Cells.AdditionalCellsCount])
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
        return indexPath.row == Constants.Cells.AdditionalCellNumber ? CGFloat(Constants.Cells.AdditionalCellsHeight) : CGFloat(Constants.Cells.ReuseIDCellsHeight)
    }
}
