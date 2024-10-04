import SwiftUI
import LocalAuthentication

struct face: View {
    @State private var isAuthenticated = false
    @State private var authenticationMessage = ""

    var body: some View {
        FaceIDPromptView(isAuthenticated: $isAuthenticated, authenticationMessage: $authenticationMessage)
    }
}

struct FaceIDPromptView: View {
    @Binding var isAuthenticated: Bool
    @Binding var authenticationMessage: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Image(systemName: "faceid")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.blue)
                .padding(.top, 20)

            Text("Face ID")
                .font(.headline)
                .padding(.top, 10)

            Text("Try Again")
                .font(.subheadline)
                .foregroundColor(.gray)

            Spacer()

            Button(action: {
                authenticateWithFaceID()
            }) {
                Text("Try Face ID Again")
                    .font(.system(size: 18))
                    .foregroundColor(.blue)
                    .padding(.bottom, 20)
            }

            Button(action: {
                dismiss()
            }) {
                Text("Cancel")
                    .font(.system(size: 18))
                    .foregroundColor(.red)
                    .padding(.bottom, 20)
            }
        }
        .frame(width: 300, height: 300)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
        .onAppear(perform: authenticateWithFaceID) // Attempt Face ID authentication when view appears
    }

    func authenticateWithFaceID() {
        let context = LAContext()
        var error: NSError?

        // Check if the device supports Face ID
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate to proceed."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        // Authentication was successful
                        isAuthenticated = true
                        authenticationMessage = "Authenticated successfully!"
                    } else {
                        // Authentication failed
                        isAuthenticated = false
                        authenticationMessage = "Face ID authentication failed. Please try again."
                    }
                }
            }
        } else {
            // Device does not support Face ID
            authenticationMessage = "Face ID is not available on this device."
        }
    }
}

#Preview {
    face()
}
