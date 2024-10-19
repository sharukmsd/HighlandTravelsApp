//
//  HTButton.swift
//  Highland Travels
//
//  Created by Shahrukh on 19/10/2024.
//

import SwiftUI

enum HTButtonType {
    case primary
    case secondary
    
    var textColor: Color {
        switch self {
        case .primary:
            return Color.light
        case .secondary:
            return Color.text
        }
    }
    
    var background: Color {
        switch self {
        case .primary:
            return Asset.primary.swiftUIColor
        case .secondary:
            return .white
        }
    }
}

struct HTButton: View {
    private let text: String
    private let onTap: (() -> Void)
    private let icon: Image?
    private let type: HTButtonType
    private let isDisabled: Bool
    
    init(_ text: String, 
         icon: Image? = nil,
         type: HTButtonType = .primary,
         isDisabled: Bool = false,
         onTap: @escaping () -> Void
    ) {
        self.text = text
        self.onTap = onTap
        self.icon = icon
        self.type = type
        self.isDisabled = isDisabled
    }
    
    var body: some View {
        Button {
            onTap()
        } label: {
            HStack(spacing: 20) {
                if let icon {
                    icon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 26, height: 26)
                }
                
                Text(text)
                    .buttonText()
            }
            .foregroundStyle(type.textColor)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 16).fill(isDisabled ? type.background.opacity(0.5) : type.background))
        }
        .frame(maxWidth: .infinity)
        .frame(height: 58)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .clipped()
        .if(type == .secondary) {
            $0.shadow(color: .dark.opacity(0.1), radius: 10)
        }
        .disabled(isDisabled)

    }
}
