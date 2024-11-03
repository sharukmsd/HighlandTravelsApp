//
//  ProfileNavigationStack.swift
//  Highland Travels
//
//  Created by Muhammad Shahrukh on 03/11/2024.
//

import SwiftUI

struct ProfileNavigationStack: View {
    
    @EnvironmentObject private var router: Router

    var body: some View {
        NavigationStack(path: $router.profileRoutes) {
            router.view(for: .profile(.detail))
                .navigationDestination(for: ProfileRoute.self) { route in
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
    ProfileNavigationStack()
}
