//
//  Route.swift
//  Highland Travels
//
//  Created by Muhammad Shahrukh on 03/11/2024.
//

import Foundation
import SwiftUI

enum Route: Hashable {
    case auth
    case home(HomeRoute)
    case explore(ExploreRoute)
    case notification(NotificationRoute)
    case profile(ProfileRoute)
}

extension Router {
    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .auth:
            AuthView(vm: AuthViewModel())
        case .home(let homeRoute):
            view(for: homeRoute)
        case .explore(let exploreRoute):
            view(for: exploreRoute)
        case .notification(let notificationRoute):
            view(for: notificationRoute)
        case .profile(let profileRoute):
            view(for: profileRoute)
        }
    }
}
