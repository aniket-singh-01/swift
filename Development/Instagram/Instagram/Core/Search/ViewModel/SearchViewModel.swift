//
//  SearchViewModel.swift
//  Instagram
//
//  Created by Aniket Singh on 16/05/24.
//

import Foundation

class SearchViewModel:ObservableObject{
    @Published var users = [User]()
    
    init(){
        Task{ try await fetchAllUsers()}
    }
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
