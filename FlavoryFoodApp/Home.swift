import SwiftUI

struct Home: View {
    var body: some View {
        ZStack {
            // Background image
            Image("new")  // The image from your assets folder named 'home'
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()

            // Overlay text and button
            VStack {
                Spacer()
                
                // App Name
                Text("Flavorly")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)

                // Start Cooking button
                Button(action: {
                    // Action for button
                    
                }) {
                    HStack {
                        Text("Start Cooking")
                        Image(systemName:"arrow.right")
                    }
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 280, height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                    
                }.padding(.top,400)
                
                Spacer()
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
