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
    
    static func getUsers() async throws -> String {
        async let (data, _) = URLSession.shared.data(from:url)
        return try await String(data: data, encoding: .utf8)! // Displaying as a raw String
        
    }
}
