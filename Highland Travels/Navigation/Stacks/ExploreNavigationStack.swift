//
//  ExploreNavigationStack.swift
//  Highland Travels
//
//  Created by Muhammad Shahrukh on 03/11/2024.
//

import SwiftUI

struct ExploreNavigationStack: View {
    
    @EnvironmentObject private var router: Router

    var body: some View {
        NavigationStack(path: $router.exploreRoutes) {
            router.view(for: .explore(.list))
                .navigationDestination(for: Route.self) { route in
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
    ExploreNavigationStack()
}
