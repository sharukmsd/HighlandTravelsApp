//
//  HomeNavigationStack.swift
//  Highland Travels
//
//  Created by Muhammad Shahrukh on 03/11/2024.
//

import SwiftUI

struct HomeNavigationStack: View {
    
    @EnvironmentObject private var router: Router

    var body: some View {
        NavigationStack(path: $router.homeRoutes) {
            router.view(for: .home(.list))
                .navigationDestination(for: HomeRoute.self) { route in
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
    HomeNavigationStack()
}
