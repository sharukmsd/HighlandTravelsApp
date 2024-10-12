//
//  LoginView.swift
//  Highland Travels
//
//  Created by Shahrukh on 12/10/2024.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack {
                
                HStack {
                    Text("LOGIN")
                        .title3()
                        .foregroundStyle(.text)
                        .padding(.top, proxy.size.height * 0.25)
                    Spacer()
                }
                
                
                Spacer()
            }
            .padding()
            .background(LoginHeader())
        }
    }
}

#Preview {
    LoginView()
}
