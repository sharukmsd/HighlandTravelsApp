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
        GenericNavigationStack(routes: $router.homeRoutes,
                               rootRoute: .home(.list),
                               destinationType: HomeRoute.self)
    }
}

#Preview {
    HomeNavigationStack()
}
