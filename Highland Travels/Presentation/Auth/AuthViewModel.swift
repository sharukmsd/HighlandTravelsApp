//
//  AuthViewModel.swift
//  Highland Travels
//
//  Created by Shahrukh on 19/10/2024.
//

import Foundation

enum AuthViewType {
    
    case login
    case signup
    
    var title: String {
        switch self {
        case .login:
            return "LOGIN"
        case .signup:
            return "SIGN UP"
        }
    }
    
    var nextButtonText: String {
        switch self {
        case .login:
            return "Login"
        case .signup:
            return "Sign Up"
        }
    }
    
    var questionText: (String, String) {
        switch self {
        case .login:
            return ("Don't have an account?", "Sign Up")
        case .signup:
            return ("Already have an account?", "Login")
        }
    }
}

protocol AuthViewModelType: ObservableObject {
    var viewType: AuthViewType { get }
    var inputUsername: String { get set }
    var inputEmail: String { get set }
    var inputPassword: String { get set }
    var fieldInfo: (String?, String?, String?) { get }
    var isValid: Bool { get }
    var isLoggedIn: Bool { get }
    func questionTapped()
    func didTapNext()
}

class AuthViewModel: AuthViewModelType {
    @Published var isValidUsername: Bool = false
    @Published var isValidEmail: Bool = false
    @Published var isValidPassword: Bool = false
    
    @Published var viewType: AuthViewType = .login
    @Published var fieldInfo: (String?, String?, String?) = (nil, nil, nil)
    @Published var isValid: Bool = false
    @Published var isLoggedIn: Bool = false
    @Published var inputUsername: String = "" {
        didSet {
            isValidUsername = !inputUsername.isEmpty
            isValid = isValidFrom()
        }
    }
    @Published var inputEmail: String = "" {
        didSet {
            isValidEmail = inputEmail.isValidEmail
            isValid = isValidFrom()
            if !isValidEmail {
                fieldInfo.1 = "Email must have a valid format i.e abc@xyz.com"
            } else {
                fieldInfo.1 = nil
            }
            
        }
    }
    @Published var inputPassword: String = "" {
        didSet {
            isValidPassword = inputPassword.isValidPassword
            isValid = isValidFrom()
            if !isValidPassword {
                fieldInfo.2 = "Password must be at least 8 characters, contain an uppercase letter, a number, and a special character."
            } else {
                fieldInfo.2 = nil
            }
        }
    }
    
    func questionTapped() {
        switch viewType {
        case .login:
            viewType = .signup
        case .signup:
            viewType = .login
        }
        inputUsername = ""
        inputEmail = ""
        inputPassword = ""
        fieldInfo = (nil, nil, nil)
    }
    
    func didTapNext() {
        guard isValidFrom() else { return }
        isLoggedIn = true
    }
}

private extension AuthViewModel {
    func isValidFrom() -> Bool {
        return viewType == .signup
        ?  (isValidUsername && isValidEmail && isValidPassword)
        : (isValidEmail && isValidPassword)
    }
}
