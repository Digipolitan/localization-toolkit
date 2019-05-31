//
//  UILabel+Localization.swift
//  LocalizationToolkitTests-iOS
//
//  Created by Benoit Briatte on 31/05/2019.
//  Copyright © 2019 Digipolitan. All rights reserved.
//

import UIKit

public extension UILabel {

    struct AssociatedKeys {
        static var localizationIdentifier: UInt8 = 0
    }

    @IBInspectable var localizationIdentifier: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.localizationIdentifier) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.localizationIdentifier, newValue, .OBJC_ASSOCIATION_RETAIN)
            if let key = newValue {
                self.text = key.localized()
            }
        }
    }
}
