//
//  UserData.swift
//  RandomUsers
//
//  Created by Clement Kodradjaja on 2022-04-03.
//

import Foundation

@MainActor
class UserData: ObservableObject {
   @Published var users: String = ""
    
    init() {
        Task {
            await loadUsers()
        }
    }
    
    func loadUsers() async {
        do {
            let users = try await UserFetchingClient.getUsers()
            self.users = users
        }
        catch {
            print(error)
        }
    }
}
