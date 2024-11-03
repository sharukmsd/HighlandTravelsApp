//
//  HomeRoute.swift
//  Highland Travels
//
//  Created by Muhammad Shahrukh on 03/11/2024.
//

import Foundation
import SwiftUI

enum HomeRoute: Hashable {
    case list
    case detail
}

extension Router {
    @ViewBuilder func view(for route: HomeRoute) -> some View {
        switch route {
        case .list:
            HomeView()
        case .detail:
            HomeDetail()
        }
    }
}
