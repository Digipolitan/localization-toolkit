//
//  NSNib+Localization.swift
//  LocalizationToolkit-OSX
//
//  Created by Benoit BRIATTE on 12/11/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import AppKit

extension NSNib {

    public static func localizedNibNamed(name: NSNib.Name, bundle: Bundle = .main) -> NSNib? {
        return NSNib(nibNamed: name, bundle: Localization.shared.localizedBundle(from: bundle))
    }
}
