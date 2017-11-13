//
//  NSStoryboad+Localization.swift
//  LocalizationToolkit-OSX
//
//  Created by Benoit BRIATTE on 12/11/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import AppKit

extension NSStoryboard {

    public static func localizedStoryboardNamed(name: NSStoryboard.Name, bundle: Bundle = .main) -> NSStoryboard {
        return NSStoryboard(name: name, bundle: Localization.shared.localizedBundle(from: bundle))
    }
}
