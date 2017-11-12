//
//  UIImage+Localization.swift
//  LocalizationToolkit
//
//  Created by Benoit BRIATTE on 12/11/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import UIKit

extension UIImage {

    public static func localizedImageNamed(name: String, ofType ext: String?, bundle: Bundle = .main) -> UIImage? {
        guard let path = bundle.localizedPath(forResource: name, ofType: ext) else {
            return nil
        }
        return UIImage(contentsOfFile: path)
    }

}
