//
//  UserFetchingClient.swift
//  RandomUsers
//
//  Created by Clement Kodradjaja on 2022-04-02.
//

import Foundation

struct UserFetchingClient {
    // Declaring the URL
    static private let url = URL(string:"https://randomuser.me/api/?results=10&format=pretty")!
    
    static func getUsers() async throws -> [User] {
        async let (data, _) = URLSession.shared.data(from:url)
        let response = try await JSONDecoder().decode(Response.self, from: data) // Displaying as a raw String
        return response.users
    }
}
