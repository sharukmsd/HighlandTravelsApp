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
        NavigationStack(path: $router.notificationsRoutes) {
            router.view(for: .notification(.list))
                .navigationDestination(for: NotificationRoute.self) { route in
                    router.view(for: route)
                }
                .fullScreenCover(isPresented: $router.isFullScreenCoverPresented) {
                    if let fullScreenRoute = router.fullScreenRoute {
                        router.view(for: fullScreenRoute)
                    }
                }
        }
    }
}

#Preview {
    NotificationsNavigationStack()
}
