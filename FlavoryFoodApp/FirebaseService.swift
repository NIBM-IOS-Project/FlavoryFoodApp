import FirebaseFirestore
import FirebaseStorage
import SwiftUI

struct Recipe: Identifiable {
    var id: String
    var name: String
    var imageUrl: String
    var likes: Int
    var createdBy: String
}

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    private var db = Firestore.firestore()
    
    func fetchRecipes() {
        db.collection("recipes").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("No documents")
                return
            }
            self.recipes = documents.map { docSnapshot -> Recipe in
                let data = docSnapshot.data()
                let id = docSnapshot.documentID
                let name = data["name"] as? String ?? ""
                let imageUrl = data["imageUrl"] as? String ?? ""
                let likes = data["likes"] as? Int ?? 0
                let createdBy = data["createdBy"] as? String ?? ""
                return Recipe(id: id, name: name, imageUrl: imageUrl, likes: likes, createdBy: createdBy)
            }
        }
    }
}
