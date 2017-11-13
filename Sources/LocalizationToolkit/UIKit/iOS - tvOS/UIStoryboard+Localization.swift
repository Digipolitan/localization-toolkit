//
//  UIStoryboard+Localization.swift
//  LocalizationToolkit
//
//  Created by Benoit BRIATTE on 12/11/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import UIKit

extension UIStoryboard {

    public static func localizedStoryboardNamed(name: String, bundle: Bundle = .main) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: Localization.shared.localizedBundle(from: bundle))
    }
}
