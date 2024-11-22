//
//  UserModel.swift
//  Highland Travels
//
//  Created by Muhammad on 23/11/2024.
//

import Foundation

struct UserModel: Identifiable {
    var id: String
    var name: String
    var email: String
    var profileImage: String
    
    init(id: String = UUID().uuidString, name: String, email: String, profileImage: String) {
        self.id = id
        self.name = name
        self.email = email
        self.profileImage = profileImage
    }
    
    static let `default` = UserModel(name: "Muhammad Shahrukh", email: "sharuk.msd6@gmail.com",
                                     profileImage: "https://i.pravatar.cc/300")
}
