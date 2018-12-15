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

class UserCell: UITableViewCell, ImagePickerDelegate {
    
    @IBOutlet weak var nameSurnameLabel: UILabel!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func showSettingsView(_ sender: Any) {
        guard let homeViewController = self.superview?.parentContainerViewController() as? HomeViewController else { return }
        let settingsViewController = UIStoryboard.initializeViewController(SettingsViewController.self)
        
        settingsViewController.loggedInUser = homeViewController.loggedInUser
        homeViewController.navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    @IBAction func choosePhoto(_ sender: Any) {
        self.window?.rootViewController!.present(setupImagePicker(), animated: true, completion: nil)
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
    
    
    // MARK: - ImagePickerDelegate
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        guard images.count > 0 else { return }
        //            let lightboxImages = images.map {
        //                return LightboxImage(image: $0)
        //            }
        //            let lightbox = LightboxController(images: lightboxImages, startIndex: 0)
        //            imagePicker.present(lightbox, animated: true, completion: nil)
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
    
        photoButton.setImage(images.first, for: .normal)
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    
}
