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
    
    var locale: Locale? {
        get { return self.locale }
        set { self.locale = newValue }
    }
    
}
