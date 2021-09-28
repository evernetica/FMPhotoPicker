//
//  String+Extension.swift
//  FMPhotoPicker
//
//  Created by Ihor Tovkach on 24.09.2021.
//  Copyright © 2021 Cong Nguyen. All rights reserved.
//

import Foundation

class Strings {
  static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
      let format = NSLocalizedString(key, tableName: table, bundle: Bundle.current, comment: "")
      return String(format: format, locale: SharedLocaleManager.shared.locale, arguments: args)
    }
}

public class SharedLocaleManager {
    static let shared = SharedLocaleManager()

    public var locale: Locale = .current
}
