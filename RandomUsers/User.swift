//
//  User.swift
//  RandomUsers
//
//  Created by Clement Kodradjaja on 2022-04-03.
//

import Foundation

// Since 'Response' conform to decodable, all other properties in Response must also conform to Decodable
struct Response: Decodable {
    let users: [User]
    
    enum CodingKeys: String,CodingKey {
        case users = "results"
    }
}

struct User: Decodable, Identifiable {
    let id: String
    let name: Name
    
    var fullName: String {
        name.title + ". " + name.first + " " + name.last
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(Name.self, forKey: .name)
        let loginInfo = try values.nestedContainer(keyedBy: LoginInfoCodingKeys.self, forKey: .login)
        id = try loginInfo.decode(String.self, forKey: .uuid)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case login
    }
    
    enum LoginInfoCodingKeys: String, CodingKey {
        case uuid
    }
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}
