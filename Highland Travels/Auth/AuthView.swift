//
//  AuthView.swift
//  Highland Travels
//
//  Created by Shahrukh on 19/10/2024.
//

import SwiftUI

struct AuthView<T>: View where T: AuthViewModelType {
    
    @StateObject var vm: T
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack (spacing: 20) {
                    
                    HStack {
                        Text(vm.viewType.title)
                            .title3()
                            .foregroundStyle(.text)
                            .padding(.top, proxy.size.height * 0.25)
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    if vm.viewType == .signup {
                        InputField("Username",
                                   text: $vm.inputUsername,
                                   info: vm.fieldInfo.0,
                                   leftIcon: Image(.iconUser),
                                   type: .emailAddress
                        )
                    }
                    
                    InputField("Email",
                               text: $vm.inputEmail,
                               info: vm.fieldInfo.1,
                               leftIcon: Image(.iconMail),
                               type: .emailAddress
                    )
                    
                    InputField("Password",
                               text: $vm.inputPassword,
                               info: vm.fieldInfo.2,
                               leftIcon: Image(.iconLock),
                               isSecured: true
                    )
                    
                    HStack {
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Forgot Password?")
                                .body()
                                .foregroundStyle(.text)
                        }
                    }
                    
                    HTButton(vm.viewType.nextButtonText, isDisabled: !vm.isValid) {
                        vm.didTapNext()
                    }
                    .padding(.top, 24)
                    
                    HStack {
                        Text("OR")
                            .bold()
                            .foregroundStyle(.subtleText)
                            .padding(.top)
                        
                    }
                    
                    HTButton("Continue with Google",
                             icon: Image(.iconGoogle),
                             type: .secondary,
                             onTap: {
                        
                    })
                    
                    HStack {
                        Text(vm.viewType.questionText.0)
                            .body()
                            .foregroundStyle(.text)
                        Button {
                            vm.questionTapped()
                        } label: {
                            Text (vm.viewType.questionText.1)
                                .buttonTextStyle()
                                .foregroundStyle(Asset.secondary.swiftUIColor)
                        }
                    }
                    .padding(.vertical, 48)
                    
                }
                .padding()
                .animation(.spring(), value: vm.viewType)
            }
            .background(AuthHeader())
        }
    }
}

#Preview {
    AuthView(vm: AuthViewModel())
}
