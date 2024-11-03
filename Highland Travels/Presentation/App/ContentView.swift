//
//  ContentView.swift
//  Highland Travels
//
//  Created by Shahrukh on 12/10/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var router = Router()
    @StateObject private var session = SessionManager()
    
    var body: some View {
        Group {
            if session.isLoggedIn {
                MainTabView()
            } else {
                router.view(for: .auth)
            }
        }
        .environmentObject(router)
        .environmentObject(session)
        .environment(\.navigate, NavigateAction(
            navigate: { route, isFullScreen in
                router.navigate(to: route, isFullScreen: isFullScreen)
            },
            navigateBack: {
                router.navigateBack()
            },
            popToRoot: {
                router.popToRoot()
            }
        ))
        .animation(.smooth, value: session.isLoggedIn)
    }
}

#Preview {
    ContentView()
}
