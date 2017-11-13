//
//  Bundle+Localization.swift
//  LocalizationToolkit
//
//  Created by Benoit BRIATTE on 12/11/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

extension Bundle {

    public func localizedPath(forResource name: String?, ofType ext: String?, inDirectory subpath: String? = nil) -> String? {
        return Localization.shared.localizedBundle(from: self)?.path(forResource: name, ofType: ext, inDirectory: subpath)
    }

    public func localizedUrl(forResource name: String?, withExtension ext: String?, subdirectory: String? = nil) -> URL? {
        return Localization.shared.localizedBundle(from: self)?.url(forResource: name, withExtension: ext, subdirectory: subdirectory)
    }

}
