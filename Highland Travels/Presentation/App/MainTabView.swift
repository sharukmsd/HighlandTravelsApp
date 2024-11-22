//
//  MainTabView.swift
//  Highland Travels
//
//  Created by Muhammad Shahrukh on 03/11/2024.
//

import SwiftUI

enum TabItem: Identifiable, Hashable, CaseIterable {
    case home
    case explore
    case notifications
    case profile
    
    var id: TabItem { self }
    
    var icon: Image {
        switch self {
        case .home:
            return Image(.iconHome)
        case .explore:
            return Image(.iconBook)
        case .notifications:
            return Image(.iconNotification)
        case .profile:
            return Image(.iconUser)
        }
    }
}

extension Router {
    @ViewBuilder func tabView(for tab: TabItem) -> some View {
        switch tab {
        case .home:
            HomeNavigationStack()
        case .explore:
            ExploreNavigationStack()
        case .notifications:
            NotificationsNavigationStack()
        case .profile:
            ProfileNavigationStack()
        }
    }
}

struct MainTabView: View {
    
    @EnvironmentObject private var router: Router
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            ForEach(TabItem.allCases) { tab in
                router.tabView(for: tab)
                    .tag(tab as TabItem)
                    .tabItem {
                        tab.icon
                            .renderingMode(.template)
                            .foregroundStyle(router.selectedTab == tab ? Color.primary : Color.subtleText)
                    }
            }
        }
        .accentColor(Asset.primary.swiftUIColor)
    }
}

#Preview {
    MainTabView()
}
