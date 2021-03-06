//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 colors.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 0 files.
  struct file {
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 14 images.
  struct image {
    /// Image `btn_add_note`.
    static let btn_add_note = Rswift.ImageResource(bundle: R.hostingBundle, name: "btn_add_note")
    /// Image `btn_login`.
    static let btn_login = Rswift.ImageResource(bundle: R.hostingBundle, name: "btn_login")
    /// Image `btn_photo`.
    static let btn_photo = Rswift.ImageResource(bundle: R.hostingBundle, name: "btn_photo")
    /// Image `btn_register`.
    static let btn_register = Rswift.ImageResource(bundle: R.hostingBundle, name: "btn_register")
    /// Image `btn_settings`.
    static let btn_settings = Rswift.ImageResource(bundle: R.hostingBundle, name: "btn_settings")
    /// Image `ic_center_align`.
    static let ic_center_align = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_center_align")
    /// Image `ic_expand_arrow`.
    static let ic_expand_arrow = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_expand_arrow")
    /// Image `ic_justify_align`.
    static let ic_justify_align = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_justify_align")
    /// Image `ic_left_align`.
    static let ic_left_align = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_left_align")
    /// Image `ic_no_notes`.
    static let ic_no_notes = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_no_notes")
    /// Image `ic_right_align`.
    static let ic_right_align = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_right_align")
    /// Image `ic_share`.
    static let ic_share = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_share")
    /// Image `ic_supernote`.
    static let ic_supernote = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_supernote")
    /// Image `ic_text_field`.
    static let ic_text_field = Rswift.ImageResource(bundle: R.hostingBundle, name: "ic_text_field")
    
    /// `UIImage(named: "btn_add_note", bundle: ..., traitCollection: ...)`
    static func btn_add_note(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.btn_add_note, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "btn_login", bundle: ..., traitCollection: ...)`
    static func btn_login(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.btn_login, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "btn_photo", bundle: ..., traitCollection: ...)`
    static func btn_photo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.btn_photo, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "btn_register", bundle: ..., traitCollection: ...)`
    static func btn_register(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.btn_register, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "btn_settings", bundle: ..., traitCollection: ...)`
    static func btn_settings(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.btn_settings, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ic_center_align", bundle: ..., traitCollection: ...)`
    static func ic_center_align(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_center_align, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ic_expand_arrow", bundle: ..., traitCollection: ...)`
    static func ic_expand_arrow(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_expand_arrow, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ic_justify_align", bundle: ..., traitCollection: ...)`
    static func ic_justify_align(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_justify_align, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ic_left_align", bundle: ..., traitCollection: ...)`
    static func ic_left_align(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_left_align, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ic_no_notes", bundle: ..., traitCollection: ...)`
    static func ic_no_notes(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_no_notes, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ic_right_align", bundle: ..., traitCollection: ...)`
    static func ic_right_align(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_right_align, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ic_share", bundle: ..., traitCollection: ...)`
    static func ic_share(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_share, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ic_supernote", bundle: ..., traitCollection: ...)`
    static func ic_supernote(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_supernote, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ic_text_field", bundle: ..., traitCollection: ...)`
    static func ic_text_field(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ic_text_field, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 1 nibs.
  struct nib {
    /// Nib `UserCell`.
    static let userCell = _R.nib._UserCell()
    
    /// `UINib(name: "UserCell", in: bundle)`
    static func userCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.userCell)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `UserCell`.
    static let userCell: Rswift.ReuseIdentifier<UserCell> = Rswift.ReuseIdentifier(identifier: "UserCell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
    try nib.validate()
  }
  
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _UserCell.validate()
    }
    
    struct _UserCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType, Rswift.Validatable {
      typealias ReusableType = UserCell
      
      let bundle = R.hostingBundle
      let identifier = "UserCell"
      let name = "UserCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UserCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UserCell
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "btn_settings", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'btn_settings' is used in nib 'UserCell', but couldn't be loaded.") }
        if UIKit.UIImage(named: "btn_photo", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'btn_photo' is used in nib 'UserCell', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
      try launchScreen.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if UIKit.UIImage(named: "ic_supernote") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_supernote' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let homeViewController = StoryboardViewControllerResource<HomeViewController>(identifier: "HomeViewController")
      let loginViewController = StoryboardViewControllerResource<LoginViewController>(identifier: "LoginViewController")
      let name = "Main"
      let noteViewController = StoryboardViewControllerResource<NoteViewController>(identifier: "NoteViewController")
      
      func homeViewController(_: Void = ()) -> HomeViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: homeViewController)
      }
      
      func loginViewController(_: Void = ()) -> LoginViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: loginViewController)
      }
      
      func noteViewController(_: Void = ()) -> NoteViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: noteViewController)
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "ic_share") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_share' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "btn_register") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'btn_register' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "ic_center_align") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_center_align' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "btn_login") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'btn_login' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "ic_no_notes") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_no_notes' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "ic_text_field") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_text_field' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "btn_add_note") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'btn_add_note' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "ic_supernote") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_supernote' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "ic_justify_align") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_justify_align' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "ic_expand_arrow") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_expand_arrow' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "ic_left_align") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_left_align' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "ic_right_align") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ic_right_align' is used in storyboard 'Main', but couldn't be loaded.") }
        if _R.storyboard.main().homeViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'homeViewController' could not be loaded from storyboard 'Main' as 'HomeViewController'.") }
        if _R.storyboard.main().noteViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'noteViewController' could not be loaded from storyboard 'Main' as 'NoteViewController'.") }
        if _R.storyboard.main().loginViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'loginViewController' could not be loaded from storyboard 'Main' as 'LoginViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
