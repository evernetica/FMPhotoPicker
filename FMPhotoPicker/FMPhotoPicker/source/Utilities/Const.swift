//
//  Const.swift
//  FMPhotoPicker
//
//  Created by c-nguyen on 2018/04/05.
//  Copyright © 2018 Tribal Media House. All rights reserved.
//

import UIKit

internal let kComplexAnimationDuration: Double = 0.375
internal let kEnteringAnimationDuration: Double = 0.225
internal let kLeavingAnimationDuration: Double = 0.195
internal let kKeyframeAnimationDuration: Double = 2.0

internal let kGoldColor = UIColor(hexString: "#C9A053")
internal let kGrayColor = UIColor(red: 114/255, green: 114/255, blue: 114/255, alpha: 1)
internal let kBlackColor = Colors.dynamicColor(light: UIColor(hexString: "#000000"), dark: UIColor(hexString: "#FFFFFF"))
internal let kWhiteColor = Colors.dynamicColor(light: UIColor(hexString: "#FFFFFF"), dark: UIColor(hexString: "#000000"))
internal let kBackgroundColor = Colors.dynamicColor(light: UIColor(hexString: "#ffffff"), dark: UIColor(hexString: "#252525"))
internal let kTransparentBackgroundColor = UIColor(white: 1, alpha: 0.9)
internal let kBorderColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1)

internal let kDefaultFilter = FMFilter.None
internal let kDefaultCrop = FMCrop.ratioCustom

internal let kEpsilon: CGFloat = 0.01

internal let kFilterPreviewImageSize = CGSize(width: 90, height: 90)

class Colors {
    static func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else { return light }
        return UIColor { $0.userInterfaceStyle == .dark ? dark : light }
    }
}

internal let kDefaultAvailableFilters = [
    FMFilter.None,
    FMFilter.CIPhotoEffectChrome,
    FMFilter.CIPhotoEffectInstant,
    FMFilter.CIPhotoEffectMono,
    FMFilter.CIPhotoEffectProcess,
    FMFilter.CIPhotoEffectTransfer,
    FMFilter.CISepiaTone,
    FMFilter.CIPhotoEffectNoir,
    FMFilter.CIMinimumComponent,
    FMFilter.CIColorPosterize,
    FMFilter.CIColorMonochrome,
    FMFilter.CIColorCrossPolynomial,
    FMFilter.CIColorCube,
    FMFilter.CIColorCubeWithColorSpace,
    FMFilter.CIColorInvert,
    FMFilter.CIFalseColor,
    FMFilter.CIPhotoEffectFade,
    FMFilter.CIPhotoEffectTonal,
    FMFilter.CIVignette
]

internal let kDefaultAvailableCrops = [
    FMCrop.ratioCustom,
    FMCrop.ratioOrigin,
    FMCrop.ratioSquare,
    FMCrop.ratio4x3,
    FMCrop.ratio16x9
]

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        let red   = CGFloat(r) / 255
        let green = CGFloat(g) / 255
        let blue  = CGFloat(b) / 255
        let alpha = CGFloat(a) / 255

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
