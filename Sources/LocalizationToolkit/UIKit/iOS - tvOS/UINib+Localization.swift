//
//  UINib+Localization.swift
//  LocalizationToolkit
//
//  Created by Benoit BRIATTE on 12/11/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import UIKit

extension UINib {

    public static func localizedNibNamed(name: String, bundle: Bundle = .main) -> UINib {
        return UINib(nibName: name, bundle: Localization.shared.localizedBundle(from: bundle))
    }

}
