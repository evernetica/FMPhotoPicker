//
//  ShredLocaleManager.swift
//  FMPhotoPicker
//
//  Created by Ihor Tovkach on 27.09.2021.
//  Copyright © 2021 Cong Nguyen. All rights reserved.
//

import Foundation


class SharedLocaleManager {
    
    static let sharedInstance: SharedLocaleManager = {
        return SharedLocaleManager()
    }()
    
    private var _locale: Locale?
    var locale: Locale? {
        get { return _locale }
        set { _locale = newValue }
    }
    
}
