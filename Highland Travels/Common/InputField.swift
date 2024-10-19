//
//  InputField.swift
//  Highland Travels
//
//  Created by Shahrukh on 19/10/2024.
//

import SwiftUI

struct InputField: View {
    private let leftIcon: Image?
    private let placeholder: String
    private let type: UIKeyboardType
    private let isSecured: Bool
    private let info: String?

    @Binding var text: String

    @State private var isTextVisible: Bool
    
    init(_ placeholder: String,
         text: Binding<String>,
         info: String? = nil,
         leftIcon: Image? = nil,
         type: UIKeyboardType = .default,
         isSecured: Bool = false
    ) {
        self.leftIcon = leftIcon
        self.type = type
        self.isSecured = isSecured
        self.placeholder = placeholder
        self._text = text
        self.info = info
        
        self._isTextVisible = State(initialValue: !isSecured)
    }
    
    var body: some View {
        VStack {
            HStack (spacing: 8) {
                if let leftIcon {
                    leftIcon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }
                
                if isTextVisible {
                    TextField(placeholder, text: $text)
                        .textInputStyle(type: type)
                } else {
                    SecureField(placeholder, text: $text)
                        .textInputStyle(type: type)
                }
                
                if isSecured {
                    Button {
                        isTextVisible.toggle()
                    } label: {
                        Image(systemName: isTextVisible ? "eye" : "eye.slash")
                            .imageScale(.medium)
                            .foregroundStyle(Color.text)
                    }
                }
            }
            .padding(.horizontal)
            .frame(height: 56)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.border, lineWidth: 1)
            )
            
            if let info {
                HStack {
                    Image(systemName: "exclamationmark.circle")
                        .imageScale(.small)
                    Text(info)
                        .smallText()
                    Spacer()
                }
                .foregroundStyle(.text)
            }

        
        }
        .animation(.easeInOut, value: info)
    }
}

// MARK: View Modifier

struct TextInputModifier: ViewModifier {
    let type: UIKeyboardType
    
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.plain)
            .font(.customFont(.regular, 16))
            .foregroundStyle(Color.text)
            .keyboardType(type)
    }
}

extension View {
    func textInputStyle(type: UIKeyboardType) -> some View {
        modifier(TextInputModifier(type: type))
    }
}
