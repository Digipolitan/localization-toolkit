//
//  NSImage+Localization.swift
//  LocalizationToolkit-OSX
//
//  Created by Benoit BRIATTE on 12/11/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import AppKit

extension NSImage {

    public static func localizedImageNamed(name: String, ofType ext: String?, bundle: Bundle = .main) -> NSImage? {
        guard let path = bundle.localizedPath(forResource: name, ofType: ext) else {
            return nil
        }
        return NSImage(contentsOfFile: path)
    }

}
