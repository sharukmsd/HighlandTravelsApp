//
//  Font+Extension.swift
//  Highland Travels
//
//  Created by Shahrukh on 12/10/2024.
//

import Foundation
import SwiftUI

enum FontWeight {
    case light
    case regular
    case medium
    case semiBold
    case bold
    case extraBold
    
    var name: String {
        switch self {
        case .light:
            return "OpenSans-Light"
        case .regular:
            return "OpenSans-Regular"
        case .medium:
            return "OpenSans-Medium"
        case .semiBold:
            return "OpenSans-SemiBold"
        case .bold:
            return "OpenSans-Bold"
        case .extraBold:
            return "OpenSans-ExtraBold"
        }
    }
}

extension Font {
    static let customFont: (FontWeight, CGFloat) -> Font = { fontType, size in
        return Font.custom(fontType.name, size: size)
    }
}

extension Text {
    func title1() -> Text {
        return self.font(.customFont(.bold, 64))
    }
    func title2() -> Text {
        return self.font(.customFont(.bold, 40))
    }
    func title3() -> Text {
        return self.font(.customFont(.bold, 24))
    }
    func subtitle() -> Text {
        return self.font(.customFont(.medium, 24))
    }
    func body() -> Text {
        return self.font(.customFont(.medium, 16))
    }
    func bold() -> Text {
        return self.font(.customFont(.bold, 16))
    }
    func smallText() -> Text {
        return self.font(.customFont(.medium, 14))
    }
    func preTitle() -> Text {
        return self.font(.customFont(.bold, 10))
    }
    func buttonText() -> Text {
        return self.font(.customFont(.bold, 10))
    }
    func buttonTextStyle() -> Text {
        return self.font(.customFont(.bold, 16)).underline()
    }
    func customFont(_ fontWeight: FontWeight, _ size: CGFloat) -> Text {
        return self.font(.customFont(fontWeight, size))
    }
}
