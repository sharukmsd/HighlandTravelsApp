//
//  HomeDetail.swift
//  Highland Travels
//
//  Created by Muhammad Shahrukh on 03/11/2024.
//

import SwiftUI

struct HomeDetail: View {
    @Environment(\.navigate) var navigate

    var body: some View {
        VStack {
            Text("Go back")
                .onTapGesture {
                    navigate.back()
                }
            Text("Pop to root")
                .onTapGesture {
                    navigate.root()
                }
        }
    }
}

#Preview {
    HomeDetail()
}
