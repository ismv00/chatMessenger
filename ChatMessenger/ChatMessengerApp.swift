//
//  ChatMessengerApp.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 05/06/24.
//

import SwiftUI
import FirebaseCore

@main
struct ChatMessengerApp: App {
    init() {
        FirebaseApp.configure()
        
    }
   
    
    var body: some Scene {
        WindowGroup {
            SignInView()
        }
    }
}
