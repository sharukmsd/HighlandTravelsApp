//
//  SessionManager.swift
//  Highland Travels
//
//  Created by Muhammad Shahrukh on 03/11/2024.
//

import Foundation

class SessionManager: ObservableObject {
    
    @Published private(set) var isLoggedIn = false {
        didSet {
            UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
        }
    }
    
    init() {
        checkSession()
    }
    
    private func checkSession() {
        isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    func login() {
        isLoggedIn = true
    }

    func logout() {
        isLoggedIn = false
    }
}
