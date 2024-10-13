//
//  UIApplication+Extension.swift
//  Highland Travels
//
//  Created by Shahrukh on 13/10/2024.
//

import Foundation
import UIKit

extension UIApplication {
    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.currentActiveWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }

        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }

        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        return viewController
    }

    var currentActiveWindow: UIWindow? {
        return UIApplication.shared.connectedScenes.flatMap {
            ($0 as? UIWindowScene)?.windows ?? []
        }.first { $0.isKeyWindow }
    }
}
