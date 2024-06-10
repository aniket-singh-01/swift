//
//  ContentViewModel.swift
//  Instagram
//
//  Created by Aniket Singh on 30/04/24.
//

import Foundation
import Firebase
import Combine


class ContentViewModel: ObservableObject{
    
    private let service=AuthService.shared
    private var cancellables=Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init(){
        setupSubcribers()
    }
    func setupSubcribers(){
        service.$userSession.sink{[weak self] userSession in
            self?.userSession=userSession
        }
        .store(in: &cancellables)
        
        service.$currentUser.sink{[weak self] currentUser in
            self?.currentUser=currentUser
        }
        .store(in: &cancellables)
    }
}
