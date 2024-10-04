//
//  FlavoryFoodAppApp.swift
//  FlavoryFoodApp
//
//  Created by COCOBSCCOMP23.1P-022 on 2024-09-28.
//

import SwiftUI
import FirebaseCore



@main
struct FlavoryFoodAppApp: App {
    
    init() {
            FirebaseApp.configure()
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
