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
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
      return String(format: format, locale: Locale.current, arguments: args)
    }
}

private final class BundleToken {}
