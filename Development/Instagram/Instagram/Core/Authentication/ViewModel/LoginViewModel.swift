import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {

    @Published var password=""
    @Published var email=""
    
    func signIn() async throws{
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
