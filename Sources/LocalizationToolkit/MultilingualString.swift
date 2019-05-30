//
//  MultilingualString.swift
//  LocalizationToolkit
//
//  Created by Benoit BRIATTE on 12/11/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

open class MultilingualString: Hashable {

    public let values: [String: String]

    public convenience init(string: String) {
        self.init(values: [
            Localization.shared.fallbackLanguage: string
        ])
    }

    public init(values: [String: String]) {
        self.values = values
    }

    public func localized(specific language: String) -> String? {
        if let res = self.values[language] {
            return res
        }
        guard let languageCode = language.languageCode else {
            return nil
        }
        return self.values[languageCode]
    }

    public func localized() -> String? {
        if let res = self.localized(specific: Localization.shared.appLanguage) {
            return res
        }
        return self.localized(specific: Localization.shared.fallbackLanguage)
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.values)
    }

    public static func == (lhs: MultilingualString, rhs: MultilingualString) -> Bool {
        return lhs.values == rhs.values
    }
}
