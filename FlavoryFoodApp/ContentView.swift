//
//  ContentView.swift
//  FlavoryFoodApp
//
//  Created by Tharusha Perera COCOBSCCOMP23.1P-022 on 2024-09-28.
//  Project by NIBM-IOS-Project
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Background Image
            Image("MainScreen.png")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.orange)
                .padding()
                .edgesIgnoringSafeArea(.all)

            // Overlay Text and Button
            VStack {
                Spacer()
                
                // App Name
                Text("Flavorly")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.orange)
                    .padding(.bottom, 20)
                
                // Start Cooking Button
                Button(action: {
                    // Add button action here
                }) {
                    HStack {
                        Text("Start Cooking")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        Image(systemName: "arrow.right")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


