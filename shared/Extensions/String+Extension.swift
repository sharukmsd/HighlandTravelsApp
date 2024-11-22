//
//  String+Extension.swift
//  Highland Travels
//
//  Created by Shahrukh on 13/10/2024.
//

import Foundation

extension String {
    static var empty: String {
        return SC.empty
    }
    
    static var space: String {
        return SC.space
    }
    
    static var dash: String {
        return SC.dash
    }
}

typealias SC = StringConstants
enum StringConstants {
    
    // MARK: - Empty & symbol
    static let empty = ""
    static let space = " "
    static let dash = "-"
}


extension String {
    var isValidEmail: Bool {
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: self)
    }
    
    var isValidPhone: Bool {
        let regularExpression = "0[0-9]*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        let regularExpression = "(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: self)
    }
}
