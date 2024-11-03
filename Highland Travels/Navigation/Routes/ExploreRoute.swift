//
//  ExploreRoute.swift
//  Highland Travels
//
//  Created by Muhammad Shahrukh on 03/11/2024.
//

import Foundation
import SwiftUI

enum ExploreRoute: Hashable {
    case list
    case detail
}

extension Router {
    @ViewBuilder func view(for route: ExploreRoute) -> some View {
        switch route {
            case .list:
                Text("List Explore")
            case .detail:
                Text("Detail Explore")
        }
    }
}
