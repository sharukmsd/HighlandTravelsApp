//
//  HomeView.swift
//  Highland Travels
//
//  Created by Muhammad Shahrukh on 03/11/2024.
//

import SwiftUI
import asnycImage

struct HomeView<T>: View where T: HomeViewModelType {
    
    @StateObject var viewModel: T
    @Environment(\.navigate) private var navigate
    
    var body: some View {
        VStack {
            HStack {
                Button {} label: {
                    HStack {
                        Image(.iconMapPinFilled)
                        Text(viewModel.location)
                            .font(.appBody)
                            .foregroundStyle(.text)
                    }
                    .padding(.horizontal)
                    .frame(height: 52)
                    .overlay {
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.border, lineWidth: 1)
                    }
                }
                
                Spacer()
                
                Button {} label: {
                    CAsyncImage(urlString: viewModel.user.profileImage) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color.appPrimary)
                    }
                    .frame(width: 54, height: 54)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                }

            }
            .padding()
            
            VStack(alignment: .leading) {
                
                Text("Let's Explore the World!")
                    .font(.appSubtitle).bold()
                    .foregroundStyle(.text)
                
                InputField("Search", text: $viewModel.searchInput, leftIcon: Image(.iconSearch))
            }
            .padding(.horizontal)
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.categories) { category in
                        PillButton(text: category.rawValue,
                                   isSelected: category == viewModel.selectedCategory) {
                            viewModel.didTapCategory(category)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
            
            Spacer()
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
