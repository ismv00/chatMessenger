//
//  ChatMessengerApp.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 05/06/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct ChatMessengerApp: App {
    init() {
        FirebaseApp.configure()
    }
   
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
