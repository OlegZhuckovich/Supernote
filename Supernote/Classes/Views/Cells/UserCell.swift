//
//  UserCell.swift
//  Supernote
//
//  Created by Oleg Zhuckovich on 12/9/18.
//  Copyright © 2018 Supernote. All rights reserved.
//

import Foundation
import UIKit
import ImagePicker
import IQKeyboardManagerSwift
import RealmSwift

class UserCell: UITableViewCell, ImagePickerDelegate {
    
    @IBOutlet weak var nameSurnameLabel: UILabel!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    override func layoutSubviews() {
        guard let homeViewController = self.superview?.parentContainerViewController() as? HomeViewController else { return }
        photoView.isUserInteractionEnabled = true
        photoView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(photoViewTapped(tapGestureRecognizer:))))
        if let user = homeViewController.loggedInUser, let userPhoto = user.photo {
            setupPhotoView(userPhoto)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @objc func photoViewTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.window?.rootViewController!.present(setupImagePicker(), animated: true, completion: nil)
    }
    
    @IBAction func showSettingsView(_ sender: Any) {
        guard let homeViewController = self.superview?.parentContainerViewController() as? HomeViewController else { return }
        let settingsViewController = UIStoryboard.initializeViewController(SettingsViewController.self)
        settingsViewController.loggedInUser = homeViewController.loggedInUser
        homeViewController.navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    func setupImagePicker() -> ImagePickerController {
        var configuration = Configuration()
        configuration.doneButtonTitle = "Done"
        configuration.noImagesTitle = "There are no images here!"
        configuration.allowVideoSelection = false
        configuration.showsImageCountLabel = false
        configuration.recordLocation = false
        
        let imagePicker = ImagePickerController(configuration: configuration)
        imagePicker.imageLimit = 1
        imagePicker.delegate = self
        return imagePicker
    }
    
    func setupPhotoView(_ userPhoto: Data) {
        photoView.image = UIImage(data: userPhoto, scale: 1.0)
        photoView.layer.borderWidth = 1.0
        photoView.layer.masksToBounds = false
        photoView.layer.borderColor = UIColor.white.cgColor
        photoView.layer.cornerRadius = photoView.frame.height/2
        photoView.clipsToBounds = true
        
    }
    
    // MARK: - ImagePickerDelegate
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        guard images.count > 0 else { return }
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        guard let homeViewController = self.superview?.parentContainerViewController() as? HomeViewController else { return }
        let realm = try! Realm()
        try! realm.write {
            homeViewController.loggedInUser?.photo = Data(UIImageJPEGRepresentation(images.first!, 0.9)!)
        }
        if let user = homeViewController.loggedInUser, let userPhoto = user.photo {
            setupPhotoView(userPhoto)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
}
