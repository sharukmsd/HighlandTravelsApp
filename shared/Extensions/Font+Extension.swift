//
//  Font+Extension.swift
//  Highland Travels
//
//  Created by Shahrukh on 12/10/2024.
//

import Foundation
import SwiftUI

enum FontWeight: String {
    case light = "OpenSans-Light"
    case regular = "OpenSans-Regular"
    case medium = "OpenSans-Medium"
    case semiBold = "OpenSans-SemiBold"
    case bold = "OpenSans-Bold"
    case extraBold = "OpenSans-ExtraBold"
}

struct FontSizes {
    static let title1: CGFloat = 64
    static let title2: CGFloat = 40
    static let title3: CGFloat = 24
    static let subtitle: CGFloat = 24
    static let body: CGFloat = 16
    static let bold: CGFloat = 16
    static let smallText: CGFloat = 14
    static let preTitle: CGFloat = 10
    static let buttonText: CGFloat = 16
}

// use for other then Text
extension Font {
    static let appTitle1 = customFont(.bold, FontSizes.title1)
    static let appTitle2 = customFont(.bold, FontSizes.title2)
    static let appTitle3 = customFont(.bold, FontSizes.title3)
    static let appSubtitle = customFont(.medium, FontSizes.subtitle)
    static let appBody = customFont(.medium, FontSizes.body)
    static let appBold = customFont(.bold, FontSizes.bold)
    static let appSmallText = customFont(.medium, FontSizes.smallText)
    static let appPreTitle = customFont(.bold, FontSizes.preTitle)
    static let appButtonText = customFont(.bold, FontSizes.buttonText)

    static func customFont(_ weight: FontWeight, _ size: CGFloat) -> Font {
        Font.custom(weight.rawValue, size: size)
    }
}

// use for Text
extension Text {
    func style(_ weight: FontWeight, size: CGFloat, underline: Bool = false) -> Text {
        var text = self.font(.customFont(weight, size))
        if underline {
            text = text.underline()
        }
        return text
    }

    func title1() -> Text { style(.bold, size: FontSizes.title1) }
    func title2() -> Text { style(.bold, size: FontSizes.title2) }
    func title3() -> Text { style(.bold, size: FontSizes.title3) }
    func subtitle() -> Text { style(.medium, size: FontSizes.subtitle) }
    func body() -> Text { style(.medium, size: FontSizes.body) }
    func bold() -> Text { style(.bold, size: FontSizes.bold) }
    func smallText() -> Text { style(.medium, size: FontSizes.smallText) }
    func preTitle() -> Text { style(.bold, size: FontSizes.preTitle) }
    func buttonText() -> Text { style(.bold, size: FontSizes.buttonText, underline: true) }
    func customFont(_ weight: FontWeight, _ size: CGFloat) -> Text {
        style(weight, size: size)
    }
}
