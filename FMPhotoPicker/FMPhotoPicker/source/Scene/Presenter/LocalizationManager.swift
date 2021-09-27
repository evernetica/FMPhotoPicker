//
//  LocalizationManager.swift
//  FMPhotoPicker
//
//  Created by Ihor Tovkach on 27.09.2021.
//  Copyright © 2021 Cong Nguyen. All rights reserved.
//

import Foundation

public enum Language: String, Codable, CaseIterable {
    case en     = "en_US"
    case es     = "es_ES"
    case hi     = "hi_IN" // Hindi
    case bn     = "bn_IN" // Bangla
    case ne     = "ne_NP" // Nepali
    case or     = "or_IN" // Odia
    case pa     = "pa_IN" // Punjabi
    case ur     = "ur_IN" // Urdu

    var localized: String {
        switch self {
        case .en: return "English"
        case .es: return "Español"
        case .hi: return "हिन्दी"
        case .bn: return "বাংলা"
        case .ne: return "नेपाली"
        case .or: return "ଓଡ଼ିଆ"
        case .pa: return "ਪੰਜਾਬੀ"
        case .ur: return "اردو"
        }
    }

    var languageCode: String {
        switch self {
        case .en: return "en"
        case .es: return "es"
        case .hi: return "hi"
        case .bn: return "bn"
        case .ne: return "ne"
        case .or: return "or"
        case .pa: return "pa"
        case .ur: return "ur"
        }
    }

    init(code: String?) {
        switch code {
        case "en": self = .en
        case "es": self = .es
        case "hi": self = .hi
        case "bn": self = .bn
        case "ne": self = .ne
        case "or": self = .or
        case "pa": self = .pa
        case "ur": self = .ur
        default: self = .en
        }
    }
}


class LocalizationManager {
    private static let currentLanguageCodeKey = "currentLanguageCodeKey"

    static var currentLanguage: Language {
        get {
            if let code = UserDefaults.standard.string(forKey: currentLanguageCodeKey) {
                return Language(code: code)
            }
            return Language(code: Locale.current.languageCode)
        }
        set { UserDefaults.standard.setValue(newValue.languageCode, forKey: currentLanguageCodeKey) }
    }

    static func setLanguage(_ language: Language?) {
        if let language = language {
            currentLanguage = language
        }
        Bundle.setLanguage(currentLanguage.languageCode)
        NotificationCenter.default.post(name: NSNotification.Name("ApplicationLanguageChanged"), object: nil)
    }
}

private var associatedLanguageBundle: Character = "0"

private class PrivateBundle: Bundle {
   override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
       let bundle: Bundle? = objc_getAssociatedObject(self, &associatedLanguageBundle) as? Bundle
       return (bundle != nil)
        ? (bundle!.localizedString(forKey: key, value: value, table: tableName))
        : (super.localizedString(forKey: key, value: value, table: tableName))
   }
}

private extension Bundle {
    class func setLanguage(_ language: String) {
        guard let resorcesPath = Bundle.main.path(forResource: language, ofType: "lproj") else { return }
        let newBundle = Bundle(path: resorcesPath)

        defer { object_setClass(Bundle.main, PrivateBundle.self) }
        objc_setAssociatedObject(Bundle.main, &associatedLanguageBundle, newBundle, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}
