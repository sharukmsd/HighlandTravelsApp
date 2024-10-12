//
//  ContentView.swift
//  Highland Travels
//
//  Created by Shahrukh on 12/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .title2()
                .background(Color.primary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
