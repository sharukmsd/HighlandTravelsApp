//
//  GenericNavigationStack.swift
//  Highland Travels
//
//  Created by Muhammad Shahrukh on 03/11/2024.
//

import Foundation
import SwiftUI

struct GenericNavigationStack<RouteType: Hashable>: View {
    
    @EnvironmentObject private var router: Router

    @Binding var routes: NavigationPath
    let rootRoute: Route
    let destinationType: RouteType.Type
    
    init(routes: Binding<NavigationPath>,
         rootRoute: Route,
         destinationType: RouteType.Type
    ) {
        self._routes = routes
        self.rootRoute = rootRoute
        self.destinationType = destinationType
    }
    
    var body: some View {
        NavigationStack(path: $routes) {
            router.view(for: rootRoute)
                .navigationDestination(for: destinationType) { route in
                    if RouteType.self is HomeRoute.Type {
                        router.view(for: route as! HomeRoute)
                    } else if RouteType.self is ExploreRoute.Type {
                        router.view(for: route as! ExploreRoute)
                    } else if RouteType.self is NotificationRoute.Type {
                        router.view(for: route as! NotificationRoute)
                    } else if RouteType.self is ProfileRoute.Type {
                        router.view(for: route as! ProfileRoute)
                    } else {
                        Text("Route not found")
                    }
                }
                .fullScreenCover(isPresented: $router.isFullScreenCoverPresented) {
                    if let fullScreenRoute = router.fullScreenRoute {
                        router.view(for: fullScreenRoute)
                    }
                }
        }
    }
}
