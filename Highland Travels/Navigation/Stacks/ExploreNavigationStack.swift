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
        GenericNavigationStack(routes: $router.exploreRoutes,
                               rootRoute: .explore(.list),
                               destinationType: ExploreRoute.self)
    }
}

#Preview {
    ExploreNavigationStack()
}
