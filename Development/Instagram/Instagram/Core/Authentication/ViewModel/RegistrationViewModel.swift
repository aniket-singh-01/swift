import Foundation
import FirebaseAuth

class RegistrationViewModel: ObservableObject {
    @Published var username=""
    @Published var password=""
    @Published var email=""
    
    func createUser() async throws{
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        
        username=""
        password=""
        email=""
    }
}
