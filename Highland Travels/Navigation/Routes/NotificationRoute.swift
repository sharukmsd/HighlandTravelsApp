//
//  NotificationRoute.swift
//  Highland Travels
//
//  Created by Muhammad Shahrukh on 03/11/2024.
//

import Foundation
import SwiftUI

enum NotificationRoute: Hashable {
    case list
    case detail
}

extension Router {
    @ViewBuilder func view(for route: NotificationRoute) -> some View {
        switch route {
            case .list:
                Text("List Notifications")
            case .detail:
                Text("Detail Notification")
        }
    }
}
