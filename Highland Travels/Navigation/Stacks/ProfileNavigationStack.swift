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
        GenericNavigationStack(routes: $router.profileRoutes,
                               rootRoute: .profile(.detail),
                               destinationType: ProfileRoute.self)
    }
}

#Preview {
    ProfileNavigationStack()
}
