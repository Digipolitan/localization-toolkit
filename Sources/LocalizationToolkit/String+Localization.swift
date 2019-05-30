//
//  String+Localization.swift
//  LocalizationToolkit
//
//  Created by Benoit BRIATTE on 24/10/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

extension String {

    public var languageCode: String? {
        guard let dashIndex = self.firstIndex(where: { letter in
            return letter == "-" || letter == "_"
        }) else {
            return nil
        }
        return String(self[..<dashIndex])
    }

    public var countryCode: String? {
        guard let dashIndex = self.firstIndex(where: { letter in
            return letter == "-" || letter == "_"
        }) else {
            return nil
        }
        return String(self[self.index(dashIndex, offsetBy: 1)...])
    }

    public func localized(bundle: Bundle = .main, table: String? = nil, value: String? = nil) -> String {
        return Localization.shared.localizedBundle(from: bundle)?.localizedString(forKey: self, value: value, table: table) ?? self
    }

    public func localized(bundle: Bundle = .main, table: String? = nil, value: String? = nil, arguments: CVarArg...) -> String {
        return self.localized(bundle: bundle, table: table, value: value, arguments: arguments)
    }

    public func localized(bundle: Bundle = .main, table: String? = nil, value: String? = nil, arguments: [CVarArg]) -> String {
        return String(format: self.localized(bundle: bundle, table: table, value: value), arguments: arguments)
    }
}
