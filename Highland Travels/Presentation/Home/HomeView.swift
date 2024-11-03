//
//  HomeView.swift
//  Highland Travels
//
//  Created by Muhammad Shahrukh on 03/11/2024.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.navigate) var navigate
    
    var body: some View {
        VStack {
            Text("Go to detail")
                .onTapGesture {
                    navigate(.home(.detail))
                }
            Text("Present full screen cover")
                .onTapGesture {
                    navigate(.home(.detail), isFullScreen: true)
                }
        }
    }
}

#Preview {
    HomeView()
}
