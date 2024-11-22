//
//  HomeViewModel.swift
//  Highland Travels
//
//  Created by Muhammad on 23/11/2024.
//


import Foundation

enum CategoryType: String, Identifiable, CaseIterable {
    case nearest = "Nearest"
    case popular = "Popular"
    case recommended = "Recommended"
    case topRated = "Top Rated"
    case trending = "Trending"
    
    var id: String { self.rawValue }
}

protocol HomeViewModelType: ObservableObject {
    var location: String { get }
    var user: UserModel { get }
    var searchInput: String { get set }
    var selectedCategory: CategoryType { get }
    var categories: [CategoryType] { get }
    func didTapLocation()
    func didTapProfile()
    func didTapCategory(_ category: CategoryType)
}

class HomeViewModel: HomeViewModelType {
    @Published var location: String = "Lahore, Pakistan"
    @Published var searchInput: String = ""
    @Published var selectedCategory: CategoryType = .nearest
    let categories: [CategoryType] = CategoryType.allCases
    
    let user: UserModel = .default
    
    func didTapLocation() {}
    func didTapProfile() {}
    
    func didTapCategory(_ category: CategoryType) {
        selectedCategory = category
    }
}
