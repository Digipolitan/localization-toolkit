//
//  Localization.swift
//  LocalizationToolkit
//
//  Created by Benoit BRIATTE on 12/11/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import Foundation

public class Localization {

    public enum Keys {
        public static let app = "LocalizationLanguage"
        public static let device = "AppleLanguages"
    }

    public static var baseBundle = "Base"
    public static var fallbackLanguage = "en"

    public static let shared = Localization()

    public private(set) var appLanguage: String {
        didSet {
            self.appLocale = NSLocale(localeIdentifier: self.appLanguage)
            UserDefaults.standard.set(self.appLanguage, forKey: Keys.app)
            UserDefaults.standard.synchronize()
            NotificationCenter.default.post(name: Notification.Name.LocalizationDidChange, object: nil)
        }
    }

    public let appLanguages: [String]

    public var deviceLanguages: [String] {
        didSet {
            UserDefaults.standard.set(self.deviceLanguages, forKey: Keys.device)
            UserDefaults.standard.synchronize()
        }
    }

    public private(set) var appLocale: NSLocale

    private var localizedBundleCache: [String: [String: Bundle]]

    private init() {
        self.appLanguage =  Localization.loadAppLanguage()
        self.deviceLanguages = UserDefaults.standard.object(forKey: Keys.device) as? [String] ?? []
        var appLanguages = Bundle.main.localizations
        if let index = appLanguages.index(of: Localization.baseBundle) {
            appLanguages.remove(at: index)
        }
        self.appLanguages = appLanguages
        self.appLocale = NSLocale(localeIdentifier: self.appLanguage)
        self.localizedBundleCache = [:]
    }

    public func changeAppLanguage(_ language: String) {
        if Bundle.main.contains(language: language) {
            if self.appLanguage != language {
                self.appLanguage = language
            }
        }
    }

    public func displayName(language: String) -> String? {
        return self.appLocale.displayName(forKey: NSLocale.Key.identifier, value: language)
    }

    public func localizedBundle(language: String? = nil, from bundle: Bundle = .main) -> Bundle? {
        let lg = language ?? self.appLanguage
        if let cache = self.localizedBundleCache[bundle.bundlePath]?[lg] {
            return cache
        }
        if self.localizedBundleCache[bundle.bundlePath] == nil {
            self.localizedBundleCache[bundle.bundlePath] = [:]
        }
        if let localizedBundle = bundle.localizedBundle(language: lg) {
            self.localizedBundleCache[bundle.bundlePath]?[lg] = localizedBundle
            return localizedBundle
        }
        if let baseBundle = bundle.localizedBundle(language: Localization.baseBundle) {
            self.localizedBundleCache[bundle.bundlePath]?[lg] = baseBundle
            return baseBundle
        }
        return nil
    }

    private static func loadAppLanguage() -> String {
        if let appLanguage = UserDefaults.standard.object(forKey: Keys.app) as? String {
            if Bundle.main.contains(language: appLanguage) {
                return appLanguage
            }
            UserDefaults.standard.removeObject(forKey: Keys.app)
            UserDefaults.standard.synchronize()
        }
        return Bundle.main.preferredLocalizations.first ?? Localization.fallbackLanguage
    }
}

public extension Notification.Name {

    public static let LocalizationDidChange = Notification.Name("LocalizationDidChangeNotification")
}

fileprivate extension Bundle {
    fileprivate func contains(language: String) -> Bool {
        if self.localizations.contains(language) {
            return true
        }
        guard let dashIndex = language.index(of: "-") else {
            return false
        }
        return self.localizations.contains(String(language[..<dashIndex]))
    }

    fileprivate func localizedBundle(language: String) -> Bundle? {
        if let path = self.path(forResource: language, ofType: "lproj"), let localized = Bundle(path: path) {
            return localized
        }
        guard let dashIndex = language.index(of: "-") else {
            return nil
        }
        return self.localizedBundle(language: String(language[..<dashIndex]))
    }
}
