import SwiftUI

struct Questionnaire1View: View {
    // State variables to track selected options
    @State private var selectedOptions: [String] = []
    
    // List of available options
    let options = ["Yes!, Don’t show me meat Recipes ", "No!, Show me all Recipes"]
    
    var body: some View {
        VStack(alignment: .leading) {
            // Title Section
            HStack {
                Text("Quick Questionnaire")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                Spacer()
            }
            .padding(.horizontal, 20)
            
            // Subtitle Section
            HStack {
                Text("Are you a vegetarian?")
                    .font(.body)
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 100)
            
            
            // Options List
            ForEach(options, id: \.self) { option in
                Button(action: {
                    // Logic to allow selecting up to two options
                    toggleOption(option)
                }) {
                    Text(option)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedOptions.contains(option) ? Color.orange : Color.gray.opacity(0.2))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 10)
                }
                .disabled(selectedOptions.count >= 2 && !selectedOptions.contains(option)) // Disable if two options are already selected
            }
            
            Spacer()
            HStack {
                Circle() // First dot (active)
                    .fill(Color.orange)
                    .frame(width: 10, height: 10)
                
                Circle() // Second dot (inactive)
                    .fill(Color.gray)
                    .frame(width: 10, height: 10)
            }
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity, alignment: .center) // Centers the dots
            
            // Finish Button
            
        }
    }
    
    // Helper function to toggle option selection
    func toggleOption(_ option: String) {
        if selectedOptions.contains(option) {
            selectedOptions.removeAll { $0 == option }
        } else if selectedOptions.count < 2 {
            selectedOptions.append(option)
        }
    }
}

struct Questionnaire1View_Previews: PreviewProvider {
    static var previews: some View {
        Questionnaire1View()
    }
}
