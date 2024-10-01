import SwiftUI

struct OTPVerificationView: View {
    @State private var otp = ["", "", "", ""] // Holds the OTP digits
    @State private var isOTPValid = false
    @State private var countdown = 60 // Resend timer
    @State private var isTimerActive = false
    
    var body: some View {
        VStack {
            Text("OTP Verification")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading) // Align text to the left
                .padding(.top, 30)
                .padding(.leading, 20)
            
            Text("Type the 4 digit verification code (OTP) sent to your phone number")
                .font(.subheadline)
                
                .padding(.horizontal, 20)
                .padding(.top, 10)
            
            HStack(spacing: 15) {
                ForEach(0..<4, id: \.self) { index in
                    OTPTextField(otpDigit: $otp[index])
                }
            }
            .padding(.vertical, 30)
            
            if isTimerActive {
                Text("Didn't receive the code? Resend (\(countdown))")
                    .foregroundColor(.gray)
            } else {
                Button(action: startTimer) {
                    Text("Resend")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
            }
            
            Button(action: verifyOTP) {
                HStack {
                    Text("Verify")
                    Image(systemName: "arrow.right")
                }
                .font(.system(size: 18))
                .frame(width: 280, height: 50)
                .foregroundColor(.white)
                .background(Color.orange)
                .cornerRadius(10)
            }
            .padding(.top, 30)
            
            Spacer()
        }
        .padding()
        .onAppear(perform: startTimer) // Start the timer when the view appears
    }
    
    // Starts the resend countdown timer
    func startTimer() {
        isTimerActive = true
        countdown = 60
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if countdown > 0 {
                countdown -= 1
            } else {
                isTimerActive = false
                timer.invalidate()
            }
        }
    }
    
    // Verify the OTP
    func verifyOTP() {
        isOTPValid = otp.joined().count == 4 // Example logic for OTP validation
        if isOTPValid {
            print("OTP Verified")
        } else {
            print("Invalid OTP")
        }
    }
}

struct OTPTextField: View {
    @Binding var otpDigit: String
    
    var body: some View {
        TextField("", text: $otpDigit)
            .frame(width: 50, height: 50)
            .multilineTextAlignment(.center)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(5)
            .keyboardType(.numberPad)
            .onChange(of: otpDigit) { newValue in
                if newValue.count > 1 {
                    otpDigit = String(newValue.prefix(1)) // Only keep the first digit
                }
            }
    }
}

#Preview {
    OTPVerificationView()
}
