import SwiftUI

struct QuestionnaireView: View {
    // State variable to track the selected option
    @State private var selectedOption: String? = nil
    
    // List of available options
    let options = ["Quick & Easy", "Healthy & Nutritious", "Low-Calorie", "Family-Friendly"]
    
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
                Text("What type of recipes are you most interested in?")
                    .font(.body)
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            HStack {
                Text("Select one of them")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            
            // Options List
            ForEach(options, id: \.self) { option in
                Button(action: {
                    // Logic to allow selecting only one option
                    toggleOption(option)
                }) {
                    Text(option)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedOption == option ? Color.orange : Color.gray.opacity(0.2))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 10)
                }
            }
            
            Spacer()
            
            // Finish Button
            Button(action: {
                // Action for finish button
                print("Finished with selection: \(selectedOption ?? "No Selection")")
            }) {
                Text("Finish")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
            }
            .padding(.bottom, 40)
            .disabled(selectedOption == nil) // Only enable the button if an option is selected
            
            // Dots at the bottom for pagination
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
        }
    }
    
    // Helper function to toggle option selection (single option only)
    func toggleOption(_ option: String) {
        if selectedOption == option {
            selectedOption = nil // Deselect if the same option is clicked
        } else {
            selectedOption = option // Select a new option
        }
    }
}

struct QuestionnaireView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnaireView()
    }
}
