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

    public enum InfoKeys {
        public static let root = "LocalizationToolkit"
        public static let fallbackLanguage = "FallbackLanguage"
    }

    public static let shared = Localization()

    public let fallbackLanguage: String

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
        let settings = Bundle.main.infoDictionary?[InfoKeys.root] as? [String: Any]
        let fallbackLanguage = (settings?[InfoKeys.fallbackLanguage] as? String) ?? "en"
        self.fallbackLanguage = fallbackLanguage
        self.appLanguage =  Localization.loadAppLanguage() ?? fallbackLanguage
        self.deviceLanguages = UserDefaults.standard.object(forKey: Keys.device) as? [String] ?? []
        var appLanguages = Bundle.main.localizations
        if let index = appLanguages.firstIndex(of: "Base") {
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
        let clg = language ?? self.appLanguage
        if let cache = self.localizedBundleCache[bundle.bundlePath]?[clg] {
            return cache
        }
        if self.localizedBundleCache[bundle.bundlePath] == nil {
            self.localizedBundleCache[bundle.bundlePath] = [:]
        }
        if let localizedBundle = bundle.localizedBundle(language: clg) {
            self.localizedBundleCache[bundle.bundlePath]?[clg] = localizedBundle
            return localizedBundle
        }
        if let baseBundle = bundle.localizedBundle(language: "Base") {
            self.localizedBundleCache[bundle.bundlePath]?[clg] = baseBundle
            return baseBundle
        }
        return nil
    }

    private static func loadAppLanguage() -> String? {
        if let appLanguage = UserDefaults.standard.object(forKey: Keys.app) as? String {
            if Bundle.main.contains(language: appLanguage) {
                return appLanguage
            }
            UserDefaults.standard.removeObject(forKey: Keys.app)
            UserDefaults.standard.synchronize()
        }
        return Bundle.main.preferredLocalizations.first
    }
}

public extension Notification.Name {

    static let LocalizationDidChange = Notification.Name("LocalizationDidChangeNotification")
}

fileprivate extension Bundle {
    func contains(language: String) -> Bool {
        if self.localizations.contains(language) {
            return true
        }
        guard let languageCode = language.languageCode else {
            return false
        }
        return self.contains(language: languageCode)
    }

    func localizedBundle(language: String) -> Bundle? {
        if let path = self.path(forResource: language, ofType: "lproj"), let localized = Bundle(path: path) {
            return localized
        }
        guard let languageCode = language.languageCode else {
            return nil
        }
        return self.localizedBundle(language: languageCode)
    }
}
