//
//  Router.swift
//  Highland Travels
//
//  Created by Muhammad Shahrukh on 03/11/2024.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    
    @Published var homeRoutes: NavigationPath = NavigationPath()
    @Published var exploreRoutes: NavigationPath = NavigationPath()
    @Published var notificationsRoutes: NavigationPath = NavigationPath()
    @Published var profileRoutes: NavigationPath = NavigationPath()
    
    @Published var selectedTab: TabItem = .home
    @Published var isFullScreenCoverPresented: Bool = false
    @Published var fullScreenRoute: Route?
    
    // App dependencies

    func navigate(to route: Route, isFullScreen: Bool = false) {
        if presentFullScreenIfNeeded(route, isFullScreen: isFullScreen) { return }

        switch route {
        case .home(let homeRoute):
            homeRoutes.append(homeRoute)
        case .explore(let exploreRoute):
            exploreRoutes.append(exploreRoute)
        case .notification(let notificationRoute):
            notificationsRoutes.append(notificationRoute)
        case .profile(let profileRoute):
            profileRoutes.append(profileRoute)
        case .auth:
            break
        }
    }
    
    func navigateBack() {
        if dismissFullScreenIfNeeded() { return }
        
        switch selectedTab {
        case .home:
            homeRoutes.removeLast()
        case .explore:
            exploreRoutes.removeLast()
        case .notifications:
            notificationsRoutes.removeLast()
        case .profile:
            profileRoutes.removeLast()
        }
    }
    
    func popToRoot() {
        if dismissFullScreenIfNeeded() { return }
        
        switch selectedTab {
        case .home:
            homeRoutes.removeLast(homeRoutes.count)
        case .explore:
            exploreRoutes.removeLast(exploreRoutes.count)
        case .notifications:
            notificationsRoutes.removeLast(notificationsRoutes.count)
        case .profile:
            notificationsRoutes.removeLast(profileRoutes.count)
        }
    }

    private func presentFullScreenIfNeeded(_ route: Route, isFullScreen: Bool) -> Bool {
        guard isFullScreen else { return false }
        fullScreenRoute = route
        isFullScreenCoverPresented = true
        return true
    }

    private func dismissFullScreenIfNeeded() -> Bool {
        guard isFullScreenCoverPresented else { return false }
        isFullScreenCoverPresented = false
        fullScreenRoute = nil
        return true
    }
}

//MARK: Add navigate to enviroment

struct NavigateEnvironmentKey: EnvironmentKey {
    static var defaultValue: NavigateAction = NavigateAction(
        navigate: { _, _ in },
        navigateBack: {},
        popToRoot: {}
    )
}

struct NavigateAction {
    typealias Navigate = (Route, Bool) -> Void
    typealias NavigateBack = () -> Void
    typealias PopToRoot = () -> Void
    
    let navigate: Navigate
    let navigateBack: NavigateBack
    let popToRoot: PopToRoot
    
    func callAsFunction(_ route: Route, isFullScreen: Bool = false) {
        navigate(route, isFullScreen)
    }
    
    func back() {
        navigateBack()
    }
    
    func root() {
        popToRoot()
    }
}

extension EnvironmentValues {
    var navigate: (NavigateAction) {
        get { self[NavigateEnvironmentKey.self] }
        set { self[NavigateEnvironmentKey.self] = newValue }
    }
}
