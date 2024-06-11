//
//  MessagesViewModel.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 10/06/24.
//

import Foundation
import FirebaseAuth

class MessagesViewModel : ObservableObject {
    func logout() {
        try? Auth.auth().signOut()
    }
}
