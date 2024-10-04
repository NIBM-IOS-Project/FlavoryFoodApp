import SwiftUI
import SDWebImageSwiftUI

struct RecipeListView: View {
    @ObservedObject var viewModel = RecipeViewModel()
    @State private var searchQuery = "" // State to hold the search query
    
    var filteredRecipes: [Recipe] {
        // Filter recipes based on the search query
        if searchQuery.isEmpty {
            return viewModel.recipes
        } else {
            return viewModel.recipes.filter { recipe in
                recipe.name.lowercased().contains(searchQuery.lowercased())
            }
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            // Top Search Bar Section
            VStack(spacing: 5) {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search recipe", text: $searchQuery) // Bind to the state
                            .disableAutocorrection(true)
                    }
                    .padding()
                    .background(Color.white) // Change background to white
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1) // Add border
                    )
                    
                    Button(action: {
                        print("Filter button tapped")
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 50)
                .padding(.bottom,20)
                
                // Subtitle for Trending Recipes
                Text("Trending Recipes")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.leading) // Add some left padding
                
            }
            
            // Recipe List Section
            ScrollView {
                VStack {
                    ForEach(filteredRecipes) { recipe in // Use filtered recipes
                        RecipeCardView(recipe: recipe)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                    }
                }
                .padding(.top) // Add some space at the top
            }
            .onAppear {
                viewModel.fetchRecipes()
            }
            
            // Bottom Navigation Bar Section
            HStack {
                Button(action: {
                    print("Home tapped")
                }) {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .foregroundColor(.orange)
                }
                
                Spacer()
                
                Button(action: {
                    print("Discover tapped")
                }) {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Discover")
                    }
                    .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button(action: {
                    print("Add tapped")
                }) {
                    VStack {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                    }
                    .foregroundColor(.orange)
                }
                
                Spacer()
                
                Button(action: {
                    print("Community tapped")
                }) {
                    VStack {
                        Image(systemName: "person.2.fill")
                        Text("Community")
                    }
                    .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button(action: {
                    print("Profile tapped")
                }) {
                    VStack {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                    .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 30)
            .padding(.top, 10)
            .padding(.bottom, 20)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -2)
        }
        .edgesIgnoringSafeArea(.bottom) // Extend bottom padding to the edge
    }
}

struct RecipeCardView: View {
    var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            // Recipe Image with Gradient Overlay
            ZStack {
                WebImage(url: URL(string: recipe.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(15)
                
                // Gradient Overlay
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.clear]),
                               startPoint: .bottom,
                               endPoint: .top)
                    .cornerRadius(15)
            }
            
            // Recipe Name and Likes
            HStack {
                Text(recipe.name)
                    .font(.title3) // Slightly smaller title
                    .fontWeight(.bold)
                    .foregroundColor(.primary) // Use primary color for better readability
                
                Spacer()
                
                Text("\(recipe.likes)")
                    .font(.subheadline)
                    .foregroundColor(.secondary) // Use secondary color for subtlety
                
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
            .padding(.top, 10)
            .padding(.horizontal) // Add horizontal padding for consistency
            
            // Created By
            Text("Created by: \(recipe.createdBy)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.horizontal)
                .padding(.bottom, 5)
            
            // Heart Icon
            
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2) // Softer shadow
        .padding(.horizontal)
        .padding(.vertical, 5) // Add some vertical padding to the entire card
    }
}

#Preview {
    RecipeListView()
}
