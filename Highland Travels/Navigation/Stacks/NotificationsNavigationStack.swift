//
//  NotificationsNavigationStack.swift
//  Highland Travels
//
//  Created by Muhammad Shahrukh on 03/11/2024.
//

import SwiftUI

struct NotificationsNavigationStack: View {
    
    @EnvironmentObject private var router: Router

    var body: some View {
        GenericNavigationStack(routes: $router.notificationsRoutes,
                               rootRoute: .notification(.list),
                               destinationType: NotificationRoute.self)
    }
}

#Preview {
    NotificationsNavigationStack()
}
