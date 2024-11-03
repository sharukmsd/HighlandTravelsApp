//
//  ProfileRoute.swift
//  Highland Travels
//
//  Created by Muhammad Shahrukh on 03/11/2024.
//

import Foundation
import SwiftUI

enum ProfileRoute: Hashable {
    case detail
}

extension Router {
    @ViewBuilder func view(for route: ProfileRoute) -> some View {
        switch route {
            case .detail:
                Text("Profile Detail")
        }
    }
}
