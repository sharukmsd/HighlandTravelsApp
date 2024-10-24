//
//  AuthHeader.swift
//  Highland Travels
//
//  Created by Shahrukh on 12/10/2024.
//

import SwiftUI

struct AuthHeader: View {
    var body: some View {
        GeometryReader { proxy in
            VStack (alignment: .leading) {
                ZStack (alignment: .bottom) {
                    Image(.loginHeader)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: proxy.size.width, maxHeight: proxy.size.height * 0.25)
                    
                    Image(.bottomFade)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: proxy.size.width, maxHeight: (proxy.size.height * 0.25)/2)
                }
                .ignoresSafeArea()
                Spacer()
            }
            .background(Color.light)
        }
    }
}

#Preview {
    AuthHeader()
}
