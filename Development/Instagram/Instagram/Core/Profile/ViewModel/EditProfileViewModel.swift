import SwiftUI
import Firebase
import PhotosUI

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    
    @Published var profileImage: Image?
    @Published var fullName = ""
    @Published var bio = ""
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        
        if let fullName = user.fullname {
            self.fullName = fullName
        }
        
        if let bio = user.bio {
            self.bio = bio
        }
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        // Update profile image if changed
        var data = [String: Any]()
        
        if let uiImage = uiImage {
            let imageUrl = try await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        // Update name if changed
        if !fullName.isEmpty && user.fullname != fullName {
            data["fullname"] = fullName
        }
        
        // Update bio if changed
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
            // Fetch updated user data
            try await fetchUpdatedUserData()
        }
    }
    
    func fetchUpdatedUserData() async throws { // Changed from private to internal (default)
        let doc = try await Firestore.firestore().collection("users").document(user.id).getDocument()
        guard let data = doc.data() else { return }
        
        let updatedUser = User(
            id: user.id,
            username: data["username"] as? String ?? user.username,
            profileImageUrl: data["profileImageUrl"] as? String ?? user.profileImageUrl,
            fullname: data["fullname"] as? String ?? user.fullname,
            bio: data["bio"] as? String ?? user.bio,
            email: data["email"] as? String ?? user.email
        )
        
        self.user = updatedUser
    }
}
