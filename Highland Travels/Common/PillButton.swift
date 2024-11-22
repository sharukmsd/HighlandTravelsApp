//
//  PillButton.swift
//  Highland Travels
//
//  Created by Muhammad on 23/11/2024.
//

import SwiftUI

struct PillButton: View {
    let text: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.appBody)
                .foregroundColor(isSelected ? .white : .subtleText)
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(isSelected ? Color.appPrimary : Color.subtleBackground)
                )
        }
            
    }
}

#Preview {
    PillButton(text: "Recomended", isSelected: true, action: {})
    PillButton(text: "Recomended", isSelected: false, action: {})
}
