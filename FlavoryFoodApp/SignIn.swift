import SwiftUI

struct SignInView: View {
    @State private var phoneNumber: String = ""
    
    var body: some View {
        VStack {
            // Title and subtitle
            VStack(alignment: .leading) {
                Text("Hello,")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 30)
                
                Text("Welcome Back!")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding(.top, 5)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            .padding(.top, 50)
            
            // Phone number text field
            TextField("Enter Phone Number", text: $phoneNumber)
                .padding()
                .frame(height: 50)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .keyboardType(.phonePad)
                .padding(.horizontal, 20)
                .padding(.top, 40)
            
            // Sign in button
            Button(action: {
                // Action for signing in
                print("Sign In tapped")
            }) {
                HStack {
                    Text("Sign In")
                    Image(systemName: "arrow.right")
                }
                .font(.system(size: 18))
                .frame(width: 280, height: 50)
                .foregroundColor(.white)
                .background(Color.orange)
                .cornerRadius(10)
            }
            .padding(.top, 30)
            
            // Or divider
            HStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.gray.opacity(0.3))
                
                Text("Or")
                    .foregroundColor(.gray)
                    .padding(.horizontal, 5)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.gray.opacity(0.3))
            }
            .padding(.vertical, 30)
            .padding(.horizontal, 20)
            
            // Continue anonymously button
            Button(action: {
                // Action for continuing anonymously
                print("Continue Anonymously tapped")
            }) {
                Text("Continue Anonymously")
                    .foregroundColor(Color.orange)
                    .font(.system(size: 18))
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    SignInView()
}
