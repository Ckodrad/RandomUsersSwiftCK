//
//  ContentView.swift
//  RandomUsers
//
//  Created by Clement Kodradjaja on 2022-04-02.
//

import SwiftUI

struct UsersView: View {
    @StateObject var userData = UserData()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Raw JSON Data:")
                ScrollView {
                    Text(userData.users)
                }
            }
        }
        .padding()
        .navigationTitle("Random Users")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
